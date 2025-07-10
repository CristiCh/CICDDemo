{\rtf1\ansi\ansicpg1252\cocoartf2757
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Dangerfile\
\
# Warn when a big PR is opened\
warn("This PR is pretty big") if git.lines_of_code > 500\
\
# Fail if there are TODOs\
fail("Please remove all TODO comments") if `git diff --cached`.include?("TODO")\
\
# Mention when there\'92s no PR description\
if github.pr_body.nil? || github.pr_body.strip.empty?\
  warn("Please add a description to your PR.")\
end\
}