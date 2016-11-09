#!/usr/bin/env python

import os
import pprint
import time


def get_session(map, session_id):
    if session_id not in map:
        new_session = {}
        map[session_id] = new_session
    return map[session_id]


def make_output_file():
    output_dir = os.path.join(os.path.realpath('.'), str(int(time.time())))
    os.mkdir(output_dir)
    new_file = os.path.join(output_dir, "features.json")
    return open(new_file, 'w')


def print_user_types(type_array):
    correct_quotes = []
    for little_string in type_array:
        correct_quotes.append('"' + little_string + '"')
    return '[' + (','.join(correct_quotes)) + ']'


# main program

fh = open(os.path.join(os.path.realpath('.'), "input.txt"), 'r')
lines = fh.readlines()

role_row = lines.pop(0)
role_row = role_row.strip()
roles = role_row.split("\t")
roles.pop(0)
roles.pop(0)
roles.pop(0)

# each role is an id and then a type  {1,'RA'} etc.
# the key is the column index
roles_map = {}

for i in range(0, len(roles)):
    temp = roles[i]
    temp_split = temp.split('#')
    roles_map[i] = {'role_id': temp_split[0], 'user_type': temp_split[1]}

# for key in roles_map:
#    print str(key), str(roles_map[key])

features_descriptions = {}
features_feature_key = {}
features_roles = {}
roles_to_feature_list = {}
features_to_user_types = {}

# now get the features/permissions
for line in lines:
    line = line.strip()
    #print line
    split_line = line.split("\t")
    # feature id, feature description, feature key, array of integers
    feature_id = split_line.pop(0)
    description = split_line.pop(0)
    feature_key = split_line.pop(0)
    description = description.replace('\'', '\'\'')
    if len(split_line) != len(roles):
        print 'something is seriously wrong, the role index is off\n'
    features_descriptions[feature_id] = description
    features_feature_key[feature_id] = feature_key
    features_roles[feature_id] = split_line

# for stuff in features_descriptions:
#    print stuff, features_descriptions[stuff]

# for morestuff in features_roles:
#   print morestuff, (features_roles[morestuff])

#for morestuff in features_feature_key:
#   print morestuff, (features_feature_key[morestuff])

for feature_id in features_roles:
    role_array = features_roles[feature_id]
    for x in range(0, len(role_array)):
        if role_array[x] == '1':
            role_affected = roles_map[x]
            role_id = role_affected['role_id']
            user_type = role_affected['user_type']
            feature_list = []
            if role_id in roles_to_feature_list:
                feature_list = roles_to_feature_list[role_id]
            feature_list.append(feature_id)
            roles_to_feature_list[role_id] = feature_list
            user_types_list = []
            if feature_id in features_to_user_types:
                user_types_list = features_to_user_types[feature_id]
            if user_type not in user_types_list:
                user_types_list.append(user_type)
            features_to_user_types[feature_id] = user_types_list

#for stuff in roles_to_feature_list:
#     print stuff, roles_to_feature_list[stuff]

# for stuff in features_to_user_types:
#    print stuff, features_to_user_types[stuff]

of = make_output_file()

of.write('{\n')

# create and insert the permissions
for feature_id in features_descriptions:
    json_string = '{"userType": ' + print_user_types(
        features_to_user_types[feature_id]) + ', "permissions": [' + feature_id + ']}'
    key_string = features_feature_key[feature_id]
    of.write('"' + key_string + '": ' + json_string + ',\n')


of.write('}')
of.close()
