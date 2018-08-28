#!/bin/sh

#  compileTemplates.sh
#  Pods
#
#  Created by Kay Großblotekamp on 28.08.18.
#  

sourcerycmd="../../Pods/Sourcery/bin/sourcery"
$sourcerycmd --templates "../Templates/*.swifttemplate"
