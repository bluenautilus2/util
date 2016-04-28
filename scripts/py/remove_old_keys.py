#!/usr/bin/env python

import os
import time

languages = {'_en': 'english_keys.txt',
             '_de': 'german.txt',
             '_es': 'spanish.txt',
             '_es_XM': 'spanish_european.txt',
             '_fr': 'french.txt',
             '_fr_CA': 'french_canadian.txt',
             '_in': 'indonesian.txt',
             '_zh_CN': 'chinese_simplified.txt',
             '_zh_MO': 'chinese_cantonese.txt',
             '_zh_TW': 'chinese_mandarin.txt',
             '_it': 'italian.txt',
             '_ja': 'japanese.txt',
             '_pt_BR': 'portugese.txt',
             '_ms': 'malay.txt',
             '_th': 'thai.txt',
             '_nl': 'dutch.txt'}


def is_file_translatable(filename):
    index = filename.rfind('.')
    no_extension = filename[:index]
    en_index = no_extension.find('_en')
    if en_index != -1:
        return no_extension[:en_index]


def visit_all_files(path):
    totranslate = {}

    for dirname, dirnames, filenames in os.walk(path):

        # print path to all filenames.
        for filename in filenames:
            if filename.endswith('.properties'):
                # print(os.path.join(dirname, filename))
                handlefound = is_file_translatable(filename)
                if handlefound:
                    totranslate[os.path.join(dirname, filename)] = [dirname, handlefound]

        # editing the 'dirnames' list will stop os.walk() from recursing into there.
        if 'target' in dirnames:
            # don't go into any target directories.
            dirnames.remove('target')
    return totranslate


def get_keys_and_values(full_filename):
    if not os.path.exists(full_filename):
        return {}
    fh = open(full_filename, 'r')
    lines = fh.readlines()
    map_to_return = {}
    for line in lines:
        index = line.find('=')
        if not line.startswith('#') and index != -1 and not line.startswith('error.characteristic'):
            map_to_return[line[:index]] = line[index + 1:-1]
    return map_to_return


def init_language_output_files(output_dir):
    languagefiles = {}
    for language in languages:
        newfile = os.path.join(output_dir, languages[language])
        fh = open(newfile, 'w')
        fh.close()
        languagefiles[language] = newfile
    return languagefiles

# main program

totranslate = visit_all_files('/home/bstevens/remove_keys/')
output_dir = os.path.join(os.path.realpath('.'), str(int(time.time())))
os.mkdir(output_dir)
languagefiles = init_language_output_files(output_dir)

for englishfile in totranslate:
    print 'need to translate this english file: ' + englishfile
    english_map = get_keys_and_values(englishfile)
    folder = totranslate[englishfile][0]
    fileprefix = totranslate[englishfile][1]

    for lang_key in languages:
        filetocheck = os.path.join(folder, fileprefix + lang_key + '.properties')
        existing_translations = get_keys_and_values(filetocheck)
        keys_not_in_english = []
        keys_to_keep = []
        # for each key that we found in the english map
        for translated_key in existing_translations:
            if translated_key not in english_map:
                keys_not_in_english.append(translated_key)
            else:
                keys_to_keep.append(translated_key + "=" + existing_translations[translated_key])
        if bool(keys_to_keep): #if we found strings
            keys_to_keep = sorted(keys_to_keep,  key=str.lower)
            lf = open(languagefiles[lang_key], 'a')
            for key in keys_to_keep:
                lf.write(key + '\n')
            lf.close()

myarray = ['alphabet', '.alphabet', ".bottom", 'bottom', 'Herp', 'derp', '.derp', 'He.rp']
myarray = sorted(myarray,  key=str.lower)
for word in myarray:
    print(word+"\n")
