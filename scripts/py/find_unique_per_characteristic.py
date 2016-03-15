#!/usr/bin/env python

import os
import time

english_file = 'textmessages_en.clean.properties'

language_files = ['textmessages_de.clean.properties',
             'textmessages_es.clean.properties',
             'textmessages_es_XM.clean.properties',
             'textmessages_fr_CA.clean.properties',
             'textmessages_fr.clean.properties',
             'textmessages_in.clean.properties',
             'textmessages_it.clean.properties',
             'textmessages_ja.clean.properties',
             'textmessages_ms.clean.properties',
             'textmessages_nl.clean.properties',
             'textmessages_pt_BR.clean.properties',
             'textmessages_th.clean.properties',
             'textmessages_zh_CN.clean.properties',
             'textmessages_zh_MO.clean.properties',
             'textmessages_zh_TW.clean.properties']


def get_keys_and_values(full_filename):
    if not os.path.exists(full_filename):
        return {}
    fh = open(full_filename, 'r')
    lines = fh.readlines()
    map_to_return = {}
    for line in lines:
        index = line.find('=')
        if not line.startswith('#') and index != -1:
            tempval = line[index + 1:-1]
            tempval.strip()
            tempkey = line[:index]
            tempkey.strip()
            map_to_return[tempkey] = tempval
    return map_to_return


def get_list_of_all(full_filename):
    if not os.path.exists(full_filename):
        return {}
    fh = open(full_filename, 'r')
    lines = fh.readlines()
    fh.close()
    return lines


def is_phrase_exempted(phrase):
    phrase.strip()
    if 'This question must be configured with Information Type options' in phrase:
        return True
    else:
        return False


# main program

output_dir = os.path.join(os.path.realpath('.'), str(int(time.time())))
all_lines = get_list_of_all(os.path.join(os.path.realpath('.'), english_file))

os.mkdir(output_dir)
english_output = os.path.join(output_dir, english_file)
eh = open(english_output, 'w')

map_of_lists = {}

for one_line in all_lines:
    index = one_line.find('=')
    if not one_line.startswith('#') and index != -1:
        tempval = one_line[index + 1:-1]
        tempval.strip()
        tempkey = one_line[:index]
        tempkey.strip()

        if tempkey in map_of_lists:
            map_of_lists[tempkey].append(tempval)
        else:
            new_list = []
            new_list.append(tempval)
            map_of_lists[tempkey] = new_list

print(str(len(map_of_lists)) + " keys found.\n")

for key in map_of_lists:
    current_list = map_of_lists[key]
    first = current_list[0]
    for phrase in current_list:
        if (first != phrase) and not is_phrase_exempted(phrase):
            eh.write('offending key:' + key + "phrase: " + first + " inequal to: " + phrase + "\n")

eh.close()



