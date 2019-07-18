data <- read.delim("../extractedData.txt", header = TRUE, quote = "\"", dec = ".", fill = TRUE, comment.char = "", na.strings = "NA")
data <- data[,colSums(is.na(data))<nrow(data)]
data <- data[order(data$TABLE_ID),] 

prefix <- "P"
separator <- "#"

appendNa <- function(l) {
  return(c(l, "NA"="-"))
}

elements <- list()
captionElements <- list()

#################### RQ3 and RQ4 #########################

elements[['Applied.research.methods']] <- appendNa(c("VALID"="V", "EVAL"="E"))
captionElements[['Applied.research.methods']] <- c("V"="Validation", "E"="Evaluation")

elements[['Type.of.evidence.by.category']] <- appendNa(c("EXAMPLE"="E", "SET_OF_EXPERIMENTS"="ES", "SET_OF_EXAMPLES"="EXS", "EMPIRICAL_LAB"="EL", "INDUSTRIAL_EXAMPLE"="EXI", "SET_OF_INDUSTRIAL_EXAMPLES"="EXSI", "EMPIRICAL_INDUSTRIAL"="EI", "INDUSTRIAL_EVALUATION"="EVI"))
captionElements[['Type.of.evidence.by.category']] <- c("E"="Example", "ES"="Set of experiments", "EXS"="Set of examples", "EL"="Empirical experiment in the lab", "EXI"="Example from industry", "EXSI"="Set of examples from industry", "EI"="Industrial empirical experiment", "EVI"="Industrial evaluation")

elements[['Type.of.evaluation.systems']] <- c("web"="W", 
                                              "synthetic"="S",
                                              "sensing"="SE",
                                              "mobile_robot"="MR",
                                              "mobile_app"="A",
                                              "media_converter"="MC",
                                              "math_functions"="MA",
                                              "manufacturing"="MAN",
                                              "language"="L",
                                              "information_system"="IS",
                                              "controller"="C",
                                              "consumer_electronics"="CE",
                                              "communication"="COM",
                                              "business_process"="B"
)
captionElements[['Type.of.evaluation.systems']] <- c("W"="Web", 
                                              "S"="Synthetic",
                                              "SE"="Monitoring and sensing",
                                              "MR"="Mobile robotic system",
                                              "A"="Mobile app",
                                              "MC"="Media converter",
                                              "MA"="Mathematical function",
                                              "MAN"="Manufacturing",
                                              "L"="Modeling language",
                                              "IS"="Information system",
                                              "C"="Controller",
                                              "CE"="Consumer electronics",
                                              "COM"="Communication",
                                              "B"="Business processes"
)

elements[['Type.of.limitations.and.unsolved.challenges']] <- appendNa(c("F_traceability"="T", 
                                                               "F_tool_enhancement"="TO",
                                                               "F_scalability"="S",
                                                               "F_runtime_model_update"="R",
                                                               "F_reusability"="RE",
                                                               "F_portability_enhancement"="P",
                                                               "F_platform_independence"="PI",
                                                               "F_platform_improvement"="EP",
                                                               "F_model_checking"="MC",
                                                               "F_expressiveness"="E",
                                                               "F_execution_strategy_combination"="EC",
                                                               "F_execution_correctness"="ECO",
                                                               "F_code_optimization"="O",
                                                               "F_additional_evaluation"="EV",
                                                               "F_additional_analysis"="AN",
                                                               "A_platform_issues"="PS"
))
captionElements[['Type.of.limitations.and.unsolved.challenges']] <- c("T"="Traceability enhancement", 
                                                               "TO"="Tool enhancement",
                                                               "S"="Scalabiltiy",
                                                               "R"="Support for runtime models update",
                                                               "RE"="Reusability enhancement",
                                                               "P"="Portability enhancement",
                                                               "PI"="Platform independence enhancement",
                                                               "EP"="Execution platform improvement",
                                                               "MC"="Support for model checking",
                                                               "E"="Expressiveness enhancement",
                                                               "EC"="Execution strategies combination",
                                                               "ECO"="Execution correctness assessment",
                                                               "O"="Generated code optimization",
                                                               "COV"="Better coverage of UML",
                                                               "EV"="Additional evaluation",
                                                               "AN"="Additional analysis of models",
                                                               "PS"="Platform-specific limitations"
)

#################### RQ2 modeling #########################

elements[['UML.diagrams']] <- appendNa(c("UC"="UC", 
                                       "TIME"="T", 
                                       "STRUCT"="STR",
                                       "SM"="SM",
                                       "SEQ"="SEQ",
                                       "PACK"="P",
                                       "OBJ"="O",
                                       "INTER"="INT",
                                       "DEP"="DEP",
                                       "COMP"="C",
                                       "COMM"="COMM",
                                       "CLASS"="CL",
                                       "ACT"="ACT",
                                       "COLLAB"="COLLAB",
                                       "adhoc"="AH"))
captionElements[['UML.diagrams']] <- c("UC"="Use case", 
                                  "T"="Timing", 
                                  "STRUCT"="Comp. structure",
                                  "SM"="State machine",
                                  "SEQ"="Sequence",
                                  "P"="Package",
                                  "O"="Object",
                                  "INT"="Interaction",
                                  "DEP"="Deployment",
                                  "C"="Component",
                                  "COMM"="Communication",
                                  "CL"="Class",
                                  "ACT"="Activity",
                                  "COLLAB"="Collaboration",
                                  "AH"="Ad-hoc")

elements[['Action.languages']] <- appendNa(c("ada"="ADA", 
                                             "ual"="UAL", 
                                             "c_sharp"="C\\#", 
                                             "c_base"="C", 
                                             "alf"="ALF", 
                                             "java"="J", 
                                             "c++"="C++", 
                                             "umlactions"="UA",
                                             "NO"="\\xmark"))
captionElements[['Action.languages']] <- c("ADA"="ADA", 
                                           "UAL"="UAL", 
                                           "C\\#"="C\\#", 
                                           "C"="C", 
                                           "ALF"="ALF", 
                                           "J"="Java", 
                                           "C++"="C++", 
                                           "UA"="Uml actions",
                                           "\\xmark"="Not supported")

# Required UML profiles
elements[['Explicit.UML.profiles.required']] <- appendNa(c("modelicaml"="MOD", 
                                                           "NO"="\\xmark",
                                                           "umlpa"="PA",
                                                           "umlspt"="SPT",
                                                           "systemc"="SC",
                                                           "umlrt"="RT",
                                                           "sysml"="SYS",
                                                           "marte"="M",
                                                           "ADHOC"="AH"))
captionElements[['Explicit.UML.profiles.required']] <- c("MOD"="ModelicaML", 
                                                           "\\xmark"="Not supported",
                                                           "PA"="UML-PA",
                                                           "SPT"="UML-SPT",
                                                           "SC"="SystemC UML profile",
                                                           "RT"="UML-RT",
                                                           "SYS"="SysML",
                                                           "M"="MARTE",
                                                           "AH"="Ad-hoc UML profile")

elements[['Modeling.tool']] <- appendNa(c("TOOL_INDEP"="I",
                                          "chess"="C",
                                          "sparx"="S",
                                          "rrose"="RR",
                                          "artisan"="A",
                                          "rsa"="RSA",
                                          "eclipseuml2"="EU",
                                          "papyrus"="P"))
captionElements[['Modeling.tool']] <- c("I"="Tool independent",
                                        "C"="CHESS",
                                        "S"="Sparx Enterprise Architect",
                                        "RR"="IBM Rational Rose",
                                        "A"="Artisan Real-Time Studio",
                                        "RSA"="IBM Rational Software Architect",
                                        "EU"="Eclipse UML2",
                                        "P"="Eclipse Papyrus")

elements[['fUML']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['fUML']] <- c("\\checkmark"="yes", "\\xmark"="no")

elements[['MDA.levels.covered']] <- appendNa(c("PIM"="PIM", 
                                               "PSM"="PSM", 
                                               "HW"="HW"))
captionElements[['MDA.levels.covered']] <- c("PIM"="platform-independent model", 
                                             "PSM"="platform-specific model", 
                                             "HW"="hardware")

#################### RQ2 solutions #########################

# Formal Specification Languages

elements[['Execution.strategy']] <- appendNa(c("I"="I", 
                                               "T"="T"))
captionElements[['Execution.strategy']] <- c("I"="interpretation", 
                                             "T"="translation")

elements[['Intended.benefits']] <- appendNa(c("CORRECT"="C", 
                                               "PROD"="P", 
                                               "QUALITY"="Q"))
captionElements[['Intended.benefits']] <- c("C"="correctness", 
                                             "P"="production", 
                                             "Q"="quality")

elements[['Process']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['Process']] <- c("\\checkmark"="yes", "\\xmark"="no")

elements[['Extensible']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['Extensible']] <- c("\\checkmark"="yes", "\\xmark"="no")

elements[['Readiness.level']] <- appendNa(c("HIGH"="H", 
                                              "MEDIUM"="M", 
                                              "LOW"="L"))
captionElements[['Readiness.level']] <- c("H"="high", 
                                            "M"="medium", 
                                            "L"="low")

elements[['Non.functional.properties']] <- appendNa(c("codesize"="C", 
                                            "performance"="P", 
                                            "adaptability"="A",
                                            "safety"="S",
                                            "security"="SE",
                                            "NO"="\\xmark"))
captionElements[['Non.functional.properties']] <- c("C"="code size", 
                                                    "P"="performance", 
                                                    "A"="adaptability",
                                                    "S"="safety",
                                                    "SE"="security",
                                                    "\\xmark"="not supported")

elements[['Formal.specification.languages']] <- appendNa(c("b_base"="B", 
                                                      "bhdl"="BHDL", 
                                                      "ffsm"="FFSM",
                                                      "jolie"="Jolie",
                                                      "kiv"="KIV",
                                                      "lisp"="Lisp",
                                                      "nusmv"="NuSMV",
                                                      "z"="Z",
                                                      "NO"="\\xmark"))
captionElements[['Formal.specification.languages']] <- c("B"="Event B", 
                                                         "BHDL"="BHDL", 
                                                         "FFSM"="Finiste state machine (ad-hoc)",
                                                         "Jolie"="jolie",
                                                         "KIV"="KIV",
                                                         "Lisp"="Lisp",
                                                         "NuSMV"="nusmv",
                                                         "Z"="Z",
                                                         "\\xmark"="not supported")

#################### RQ2 strategies #########################

elements[['Translation.steps']] <- appendNa(c("1"="1", 
                                            "2"="2", 
                                            "3"="3"))
captionElements[['Translation.steps']] <- c()

elements[['Intermediate.artifacts']] <- appendNa(c( 
                                              "java"="Java", 
                                              "dsl_model"="DSL model",
                                              "formal_spec"="Formal specification",
                                              "uml_model"="UML model",
                                              "xml"="XML file",
                                              "text"="Textual file"))
captionElements[['Intermediate.artifacts']] <- c()

elements[['Translation.targets']] <- appendNa(c("java"="J", 
                                            "c++"="C++",
                                            "php"="PHP",
                                            "python"="Python",
                                            ".net"=".net",
                                            "ada"="ADA",
                                            "vb"="VB",
                                            "bpel"="BPEL",
                                            "wsdl"="WSDL",
                                            "c_base"="C",
                                            "c_sharp"="C\\#\\#",
                                            "actionscript"="ActionScript",
                                            "delphi"="Delphi",
                                            "vhdl"="VHDL",
                                            "systemc"="SystemC",
                                            "html"="HTML",
                                            "xml"="XML"))
captionElements[['Translation.targets']] <- c()

elements[['Interpretation.engine']] <- appendNa(c("ADHOC"="Ad-hoc", 
                                                "acti"="ACTi",
                                                "fumlref"="fUML",
                                                "fumlvm"="fUML",
                                                "kermeta"="Kermeta",
                                                "mocas"="Mocas",
                                                "moka"="Moka",
                                                "populo"="Populo",
                                                "rsa"="RSA"))
captionElements[['Interpretation.engine']] <- c()

elements[['Software.platform']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['Software.platform']] <- c("\\checkmark"="yes", "\\xmark"="no")

elements[['Compiler']] <- appendNa(c("ADHOC"="Ad-hoc", 
                                                  "gss"="GCC",
                                                  "upad"="Upad"))
#captionElements[['Compiler']] <- c()

elements[['Target.platforms']] <- appendNa(c("aep"="Ad-hoc", 
                                     "gimple"="Gimple",
                                     "uvm"="UVM"))
captionElements[['Target.platforms']] <- c()

elements[['Traceability.links.support']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['Traceability.links.support']] <- c("\\checkmark"="yes", "\\xmark"="no")

elements[['Execution.tools.and.technologies']] <- appendNa(c(".net"="C\\#\\#", 
                                                             "acceleo"="Acceleo",
                                                             "FSMC+"="FSMC+",
                                                             "dymola"="Dymola",
                                                             "c_base"="C",
                                                             "sanz"="Sanz",
                                                             "accorduml"="Accord UML",
                                                             "aep_vm"="AEP VM",
                                                             "artisan"="Artisan",
                                                             "tdk"="TDK",
                                                             "sdl"="DSL",
                                                             "shadowacs"="Shadowacs",
                                                             "agilitysc"="Agility SC",
                                                             "atelier_b"="Atelier B",
                                                             "atl"="ATL",
                                                             "c++"="C++",
                                                             "gcc"="GCC",
                                                             "ffsm"="FFSM",
                                                             "fumlvm"="fUML",
                                                             "cameo"="Cameo",
                                                             "eclipseuml2"="EclipseUML2",
                                                             "mvflex"="MVFlex",
                                                             "hif"="HIF",
                                                             "gencode"="GenCode",
                                                             "graph_transf"="Graph T.",
                                                             "genged"="Genged",
                                                             "apache_velocity"="Apache Velocity",
                                                             "mocas"="Mocas",
                                                           "fumlref"="fUML",
                                                           "omnet++"="Omnet++",
                                                           "xml"="XML",
                                                           "mdworkbench"="MDWorkbench",
                                                           "mofscript"="MOFScript",
                                                           "kermeta"="Kermeta",
                                                           "mofm2t"="MOFM2T",
                                                           "populo"="Populo",
                                                           "performanceprophet"="Performance Prophet",
                                                           "prolog"="Prolog",
                                                           "cassandra"="Cassandra",
                                                           "qt"="QT",
                                                           "upad"="Upad",
                                                           "qvt"="QVT",
                                                           "xslt"="XSLT",
                                                           "xpand"="XPand",
                                                           "vb"="VB",
                                                           "rsa"="RSA",
                                                           "mtl"="MTL",
                                                           "asl"="ASL"))
captionElements[['Execution.tools.and.technologies']] <- c()

elements[['Model.level.debugging']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['Model.level.debugging']] <- c("\\checkmark"="yes", "\\xmark"="no")

elements[['Simulation']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['Simulation']] <- c("\\checkmark"="yes", "\\xmark"="no")

elements[['Production.system']] <- appendNa(c("YES"="\\checkmark", "NO"="\\xmark"))
captionElements[['Production.system']] <- c("\\checkmark"="yes", "\\xmark"="no")

#################### END #########################


getTableLine <- function(currentStudy, currentValues) {
  return(paste(currentStudy, " & ", paste(currentValues, collapse=" & "), "  \\\\ \n", sep=""))
}

remapLine <- function(df, columnName) {
  splitted <- strsplit(trimws(as.character(df[[columnName]])), separator)[[1]]
  otherMarked <- F
  for(i in 1:length(splitted)) {
    item <- trimws(as.character(splitted[i]))
    #print(length(item))
    if((length(item) != 0) && !is.na(item) && (item != "N/A")) {
      #print(item)
      if(item %in% names(elements[[columnName]])) {
        splitted[i] <- elements[[columnName]][[item]]
      } else {
        if(!otherMarked) {
          splitted[i] <- "Other"
          otherMarked <- T
        } else {
          splitted[i] <- NA
        }
      }
    } else {
      splitted[i] <- "-"
    }
  }
  splitted <- splitted[!is.na(splitted)]
  if(length(splitted) == 1) {
    return(as.character(splitted))
  } else {
    return(as.character(paste(splitted, collapse=", ")))
  }
}

getValues <- function(df, columns) {
  result <- list()
  for(i in 1:length(columns)) {
    result[length(result) + 1] <- as.character(remapLine(df, columns[i]))
  }
  return(result)
}

getRawValues <- function(df, columns) {
  result <- list()
  for(i in 1:length(columns)) {
    result[length(result) + 1] <- as.character(df[[columns[i]]])
  }
  return(result)
}

generateCaptionNotes <- function(columns, columnsNames) {
  result <- ""
  for(i in 1:length(columns)) {
    if(length(captionElements[[columns[i]]]) != 0) { 
      itemsMap <- do.call(paste, list(names(captionElements[[columns[i]]]), ": ", captionElements[[columns[i]]], sep="" ))
      itemsMap <- as.character(paste(itemsMap, collapse=", "))
      result <- paste(result, "\\textbf{", columnsNames[i], "}", " (", itemsMap, "). ", sep= "")
    }
  }
  return(result)
}

generate_RQ3_quality <- function(filePath) {
  dataQuality <- read.delim("../quality.txt", header = TRUE, quote = "\"", dec = ".", fill = TRUE, comment.char = "", na.strings = "NA")
  totalData <- merge(data, dataQuality, by="TABLE_ID")
  totalData <- totalData[order(totalData$TABLE_ID),]
  data <- totalData
  
  columns <- c("Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "TOTAL")

  caption <- "Quality assessment scores (RQ3)"# - \\textbf{Q1}: Is there a clear statement of the aims of the research?, \\textbf{Q2}: Is there an adequate description of the context (e.g., industrial use, lab-based investigation, product) in which the research was carried out? - \\textbf{Q3}: Is there an adequate justification and description of the research design? - \\textbf{Q4}: Is there a clear statement of obtained findings, including data supporting them? - \\textbf{Q5}: Is there a critical discussion of the researchers' roles, potential bias, and influence on the proposed research? - \\textbf{Q6}: Is there a critical discussion of potential limitations of the proposed research?"
  label <- "app_RQ3_quality"
  header1 <- "| p{1cm} | p{1cm} | p{1cm} | p{1cm} | p{1cm} | p{1cm} | p{1cm} | p{1cm} |"
  header2 <- "\\textbf{Study} & \\textbf{Q1} & \\textbf{Q2} & \\textbf{Q3} & \\textbf{Q4} & \\textbf{Q5} & \\textbf{Q6} & \\textbf{TOTAL}"
  
  # we print the table
  result <- paste("
                  \\begin{table*}[h]
                  \\centering
                  \\scriptsize {
                  \\begin{tabular}{", header1, "} 
                  \\hline",
                  header2, "\\\\ \\hline")
  for(i in 1:nrow(data)) {
    #for(i in 1:1) {
    result <- paste(result, getTableLine(paste("", data[i,]$TABLE_ID, sep=""), getRawValues(data[i,], columns)));
  }
  result <- paste(result, "\\hline
                  \\end{tabular}
                  } \\caption{", caption, "\\label{tab:", label, "}}
                  \\end{table*}")
                
  #writeLines(result)
  #writeChar(result, "clipboard-256")
  #clip <- pipe("pbcopy", "w")                       
  write(result, file=filePath)                               
  #close(clip)
}

# Applied Research Method
# Type of Evidence
# Type of Systems for Evidence
# Quality Assessment Results (TODO)
# Identified limitations 
generate_RQ3_RQ4 <- function(filePath) {
  
  columns <- c("Applied.research.methods", "Type.of.evidence.by.category", "Type.of.evaluation.systems", "Type.of.limitations.and.unsolved.challenges")
  columnsNames <- c("Research method", "Type of evidence", "Type of systems for evidence", "Identified limitations")
  
  caption <- paste("Provided evidence and quality assessment scores (RQ3), identified limitations (RQ4)")
  label <- "app_RQ3_RQ4"
  header1 <- "| p{1cm} | p{1.5cm} | p{1.5cm} | p{2.2cm} | p{2cm} |"
  header2 <- "\\textbf{Study} & \\textbf{Research method} & \\textbf{Type of evidence} & \\textbf{Type of systems for evidence} & \\textbf{Identified limitations}"
  
  # we print the table
  result <- paste("
\\begin{table*}[h]
  \\centering
  \\scriptsize {
  \\begin{tabular}{", header1, "} 
  \\hline",
  header2, "\\\\ \\hline")
  for(i in 1:nrow(data)) {
  #for(i in 1:1) {
    result <- paste(result, getTableLine(paste("", data[i,]$TABLE_ID, sep=""), getValues(data[i,], columns)));
  }
  result <- paste(result, "\\hline
  \\end{tabular}
  } \\caption{", caption, "\\label{tab:", label, "}}
\\end{table*}
                  
", "\\vspace{1cm}\\noindent Legend for Table~\\ref{tab:", label, "}.", generateCaptionNotes(columns, columnsNames))
  
  #writeLines(result)
  #writeChar(result, "clipboard-256")
  #clip <- pipe("pbcopy", "w")                       
  write(result, file=filePath)                               
  #close(clip)
}

# Required UML diagrams
# Used Action languages
# Required UML profiles
# Modeling tool
# Based on the fUML standard
# Covered MDA levels
# Support for partial models
generate_RQ2_modeling <- function(filePath) {
  
  columns <- c("UML.diagrams", "Action.languages", "Explicit.UML.profiles.required", "Modeling.tool", "fUML", "MDA.levels.covered")
  columnsNames <- c("UML diagrams", "Action lang.", "Profiles", "Tool", "fUML", "MDA levels")
  
  caption <- paste("Technical characteristics (RQ2) - UML modeling")
  label <- "app_RQ2_modeling"
  header1 <- "| p{1cm} | p{3.5cm} | p{3.5cm} | p{1.5cm} | p{1.5cm} | p{1cm} | p{2.3cm} | "
  header2 <- "\\textbf{Study} & \\textbf{UML diagrams} & \\textbf{Action lang.} & \\textbf{Profiles} & \\textbf{Tool} & \\textbf{fUML} & \\textbf{MDA levels}"
  
  # we print the table
  result <- paste("
                  \\begin{table*}[h]
                  \\centering
                  \\scriptsize {
                  \\begin{tabular}{", header1, "} 
                  \\hline",
                  header2, "\\\\ \\hline")
  for(i in 1:nrow(data)) {
    #for(i in 1:1) {
    result <- paste(result, getTableLine(paste("", data[i,]$TABLE_ID, sep=""), getValues(data[i,], columns)));
  }
  result <- paste(result, "\\hline
                  \\end{tabular}
                  } \\caption{", caption, "\\label{tab:", label, "}}
                  \\end{table*}
                  
                  ", "\\vspace{1cm}\\noindent Legend for Table~\\ref{tab:", label, "}.", generateCaptionNotes(columns, columnsNames))
  
  #writeLines(result)
  #writeChar(result, "clipboard-256")
  #clip <- pipe("pbcopy", "w")                       
  write(result, file=filePath)                               
  #close(clip)
}

# Execution strategy
# Intended Benefits
# Associated Process
# Extensibility
# Readiness Level
# Supported Non-functional Properties
# Formal Specification Languages
generate_RQ2_solutions <- function(filePath) {
  
  columns <- c("Execution.strategy", "Intended.benefits", "Process", "Extensible", "Readiness.level", "Non.functional.properties", "Formal.specification.languages")
  columnsNames <- c("Execution strategy", "Intended benefits", "Associated process", "Extensibility", "Readiness level", "Non-functional properties", "Formal languages")
  
  caption <- paste("Technical characteristics (RQ2) - Modeling execution solutions")#, generateCaptionNotes(columns, columnsNames))
  label <- "app_RQ2_solutions"
  header1 <- "| p{1cm} | p{1.5cm} | p{2cm} | p{1.5cm} | p{2cm} | p{1.5cm} | p{2.5cm} | p{1.85cm} |"
  header2 <- "\\textbf{Study} & \\textbf{Execution strategy} & \\textbf{Intended benefits} & \\textbf{Associated process} & \\textbf{Extensibility} & \\textbf{Readiness level} & \\textbf{Non-functional properties} & \\textbf{Formal specification languages}"
  
  # we print the table
  result <- paste("
                  \\begin{table*}[h]
                  \\centering
                  \\scriptsize {
                  \\begin{tabular}{", header1, "} 
                  \\hline",
                  header2, "\\\\ \\hline")
  for(i in 1:nrow(data)) {
    #for(i in 1:1) {
    result <- paste(result, getTableLine(paste("", data[i,]$TABLE_ID, sep=""), getValues(data[i,], columns)));
  }
  result <- paste(result, "\\hline
                  \\end{tabular}
                  } \\caption{", caption, "\\label{tab:", label, "}}
                  \\end{table*}
                  
                  ", "\\vspace{1cm}\\noindent Legend for Table~\\ref{tab:", label, "}.", generateCaptionNotes(columns, columnsNames))
  
  #writeLines(result)
  #writeChar(result, "clipboard-256")
  #clip <- pipe("pbcopy", "w")                       
  write(result, file=filePath)                               
  #close(clip)
}

generate_RQ2_strategies <- function(filePath) {
  
  columns <- c("Interpretation.engine", "Target.platforms", "Traceability.links.support", "Execution.tools.and.technologies", "Model.level.debugging", "Simulation", "Production.system")
  columnsNames <- c("Interpretation engine", "Target platforms", "Traceability", "Execution tools", "Model debugging", "Simulation", "Production system")
  
  caption <- paste("Technical characteristics (RQ2) - Modeling execution strategies")# - ", generateCaptionNotes(columns, columnsNames))
  label <- "app_RQ2_strategies"
  header1 <- "| p{1cm} | p{1.3cm} | p{1.2cm} | p{1.6cm} | p{2.8cm} | p{1.5cm} | p{1.4cm} | p{1.6cm} | p{1.4cm} |"
  header2 <- "\\textbf{Study} & \\textbf{Interpr. engine} & \\textbf{Target platform} & \\textbf{Traceability links} & \\textbf{Execution tools} & \\textbf{Model debugging} & \\textbf{Simulation support} & \\textbf{Production system}"
  
  # we print the table
  result <- paste("
                  \\begin{table*}[h]
                  \\centering
                  \\scriptsize {
                  \\begin{tabular}{", header1, "} 
                  \\hline",
                  header2, 
                  "\\\\ \\hline")
  for(i in 1:nrow(data)) {
    #for(i in 1:1) {
    result <- paste(result, getTableLine(paste("", data[i,]$TABLE_ID, sep=""), getValues(data[i,], columns)));
  }
  result <- paste(result, "\\hline
                  \\end{tabular}
                  } \\caption{", caption, "\\label{tab:", label, "}}
                  \\end{table*}
                  
                  ", "\\vspace{1cm}\\noindent Legend for Table~\\ref{tab:", label, "}.", generateCaptionNotes(columns, columnsNames))
  
  #writeLines(result)
  #writeChar(result, "clipboard-256")
  #clip <- pipe("pbcopy", "w")                       
  write(result, file=filePath)                               
  #close(clip)
}

generate_RQ2_strategies2 <- function(filePath) {
  
  columns <- c("Translation.steps", "Intermediate.artifacts", "Translation.targets", "Software.platform")
  columnsNames <- c("Translation steps", "Intermediate artifacts", "Tranformation targets", "Software platform")
  
  caption <- paste("Technical characteristics (RQ2) - Translation-specific data")# - ", generateCaptionNotes(columns, columnsNames))
  label <- "app_RQ2_strategies2"
  header1 <- "| p{1cm} | p{2cm} | p{4cm} | p{4cm} | p{2cm} |"
  header2 <- "\\textbf{Study} & \\textbf{Translation steps} & \\textbf{Intermediate artifacts} & \\textbf{Transformation targets} & \\textbf{Platform}"
  
  # we print the table
  result <- paste("
                  \\begin{table*}[h]
                  \\centering
                  \\scriptsize {
                  \\begin{tabular}{", header1, "} 
                  \\hline",
                  header2, 
                  "\\\\ \\hline")
  for(i in 1:nrow(data)) {
    #for(i in 1:1) {
    result <- paste(result, getTableLine(paste("", data[i,]$TABLE_ID, sep=""), getValues(data[i,], columns)));
  }
  result <- paste(result, "\\hline
                  \\end{tabular}
                  } \\caption{", caption, "\\label{tab:", label, "}}
                  \\end{table*}
                  
                  ", "\\vspace{1cm}\\noindent Legend for Table~\\ref{tab:", label, "}.", generateCaptionNotes(columns, columnsNames))
  
  #writeLines(result)
  #writeChar(result, "clipboard-256")
  #clip <- pipe("pbcopy", "w")                       
  write(result, file=filePath)                               
  #close(clip)
}

generate_RQ3_RQ4("../../../revision1_paper/tables/table_RQ3_RQ4.tex")
generate_RQ2_modeling("../../../revision1_paper/tables/table_RQ2_modeling.tex")
generate_RQ2_solutions("../../../revision1_paper/tables/table_RQ2_solutions.tex")
generate_RQ2_strategies("../../../revision1_paper/tables/table_RQ2_strategies.tex")
generate_RQ2_strategies2("../../../revision1_paper/tables/table_RQ2_strategies2.tex")
generate_RQ3_quality("../../../revision1_paper/tables/table_RQ3_quality.tex")
