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


def get_keys_and_values_backwards(full_filename):
    if not os.path.exists(full_filename):
        return {}
    fh = open(full_filename, 'r')
    lines = fh.readlines()
    map_to_return = {}
    for line in lines:
        index = line.find('=')
        if not line.startswith('#') and index != -1:
            tempkey = line[index + 1:-1]
            tempkey.strip()
            tempval = line[:index]
            tempval.strip()
            map_to_return[tempkey] = tempval
    return map_to_return

# main program

output_dir = os.path.join(os.path.realpath('.'), str(int(time.time())))
english_map = get_keys_and_values_backwards(os.path.join(os.path.realpath('.'), english_file))
os.mkdir(output_dir)

english_output = os.path.join(output_dir, english_file)
eh = open(english_output, 'w')
for english_phrase in english_map:
    eh.write(english_map[english_phrase] + ' = ' + english_phrase + '\n')
eh.close()

for language_file in language_files:
    language_map = get_keys_and_values(os.path.join(os.path.realpath('.'), language_file))
    newfile = os.path.join(output_dir, language_file)
    fh = open(newfile, 'w')

    for english_phrase in english_map:
        original_key = english_map[english_phrase]
        if original_key in language_map:
            translated_phrase = language_map[original_key]
            fh.write(original_key + ' = ' + translated_phrase + '\n')
    fh.close()
