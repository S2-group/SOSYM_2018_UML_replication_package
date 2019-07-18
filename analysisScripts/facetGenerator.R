nullFunction <- function() {}

generateExecution <- function() {
  
  plotData <- list()

  plotNames <- list()
  plotValues <- list()
  plotOrders <- list()
  plotTools <- list()
  plotDelete <- list()
  
  plotNames[['Execution.strategy']] <- 'a) Execution strategy'
  plotValues[['Execution.strategy']] <- c("T"="Translation", "I"="Interpretation")
  plotOrders[['Execution.strategy']] <- c(1,2)
  plotTools[['Execution.strategy']] <- c("T"=15, "I"=4)
  
  plotNames[['Intended.benefits']] <- 'b) Intended benefits'
  plotValues[['Intended.benefits']] <- c("QUALITY"="Quality", "PROD"="Production", "CORRECT"="Correctness")
  plotOrders[['Intended.benefits']] <- c(3,1,2)
  plotTools[['Intended.benefits']] <- c("QUALITY"=2, "PROD"=14, "CORRECT"=15)
  
  plotNames[['Process']] <- 'c) Associated process'
  plotValues[['Process']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['Process']] <- c(1,2)
  plotTools[['Process']] <- c("YES"=3, "NO"=16)
  
  
  plotNames[['Extensible']] <- 'd) Extensibility'
  plotValues[['Extensible']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['Extensible']] <- c(1,2)
  plotTools[['Extensible']] <- c("YES"=12, "NO"=7)
  
  plotNames[['Readiness.level']] <- 'e) Readiness level'
  plotValues[['Readiness.level']] <- c("MEDIUM"="Medium", "LOW"="Low", "HIGH"="High")
  plotOrders[['Readiness.level']] <- c(2,3,1)
  plotTools[['Readiness.level']] <- c("MEDIUM"=2, "LOW"=5, "HIGH"=12)
  
  plotNames[['Non.functional.properties']] <- 'f) Supported non-functional properties'
  plotValues[['Non.functional.properties']] <- c("reliability"="Reliability", "security"="Security", "safety"="Safety", "performance"="Performance", "codesize"= "Code size", "adaptability"="Adaptability", "NO"="Not supported")
  plotOrders[['Non.functional.properties']] <- c(1,3,6,2,5,4)
  # to modify graphically to make it 0: security, safety, codesize, adaptability 
  plotTools[['Non.functional.properties']] <- c("reliability" = 1, "security"= 1, "safety"= 1, "performance"= 2, "codesize"= 1, "adaptability"= 1, "NO"=17)
  plotDelete[['Non.functional.properties']] <- c("security", "safety", "codesize", "adaptability")
  
  plotData[['plotNames']] <- plotNames
  plotData[['plotValues']] <- plotValues
  plotData[['plotOrders']] <- plotOrders
  plotData[['plotTools']] <- plotTools
  plotData[['plotDelete']] <- plotDelete

  # here we define the layout of the resulting plots matrix
  plotData[['numColumns']] <- 3
  plotData[['numRows']] <- 2
  
  # here we define the size and margins of the pdf being produced
  plotData[['xSize']] <- 45
  plotData[['ySize']] <- 12
  plotData[['margin']] <- 5
  plotData[['marginLeft']] <- 23
  
  plotData[['fontSize']] <- 4
  plotData[['smallFontSize']] <- 3
  
  # the file name of the pdf being produced
  plotData[['fileName']] <- "./results/facets/execution.pdf"
  
  plotData[['plotAdditionalFacets']] <- nullFunction
  
  return(plotData)
}

generateModeling <- function() {
  
  plotData <- list()
  
  plotNames <- list()
  plotValues <- list()
  plotOrders <- list()
  plotFunctions <- list()
  plotTools <- list()
  plotDelete <- list()
  
  plotNames[['UML.diagrams']] <- 'a) Required UML diagrams'
  plotValues[['UML.diagrams']] <- c("UC"="Use case", 
                                    "TIME"="Timing", 
                                    "STRUCT"="Comp. structure",
                                    "SM"="State machine",
                                    "SEQ"="Sequence",
                                    "PACK"="Package",
                                    "OBJ"="Object",
                                    "INTER"="Interaction",
                                    "DEP"="Deployment",
                                    "COMP"="Component",
                                    "COMM"="Communication",
                                    "CLASS"="Class",
                                    "ACT"="Activity",
                                    "COLLAB"="Collaboration",
                                    "adhoc"="Ad-hoc")
  plotOrders[['UML.diagrams']] <- c(3,13,7,14,9,4,8,6,10,12,5,1,11,2)
  # to modify graphically to make it 0: TIME, PACK, COLLAB, adhoc
  plotTools[['UML.diagrams']] <- c("UC"=1, 
                                   "TIME"=1, 
                                   "STRUCT"=5,
                                   "SM"=16,
                                   "SEQ"=4,
                                   "PACK"=1,
                                   "OBJ"=1,
                                   "INTER"=1,
                                   "DEP"=3,
                                   "COMP"=5,
                                   "COMM"=2,
                                   "CLASS"=14,
                                   "ACT"=12,
                                   "COLLAB"=1,
                                   "adhoc"=1)
  plotDelete[['UML.diagrams']] <- c("TIME", "PACK", "COLLAB", "adhoc")
  
  plotNames[['Action.languages']] <- 'b) Used action languages'
  plotFunctions[['Action.languages']] <- function(plotTitle) {
    values <- c(19, 2, 3, 3, 7, 9, 12, 17, 28)
    toolValues <- c(8, 2, 3, 1, 1, 0, 3, 3, 1)
    categories <- c("Other languages", "Ada", "UAL", "C#", "C", "Alf", "Java", "C++", "Uml actions")
    plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
    par(new=T)
    barplot(toolValues, main="", xlim=c(0, nrow(df)+5), axes=F, horiz=TRUE, col="grey40")
    par(new=F)
    text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
  }
  
  plotNames[['Explicit.UML.profiles.required']] <- 'c) Applied UML profiles'
  plotFunctions[['Explicit.UML.profiles.required']] <- function(plotTitle) {
    values <- c(1, 1, 2, 2, 4, 8, 16, 27)
    toolValues <- c(0, 0, 0, 0, 0, 3, 2, 5)
    categories <- c("ModelicaML", "UML-PA", "UML-SPT", "SystemC UML profile", "UML-RT", "SysML", "MARTE", "Ad-hoc UML profile")
    plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
    par(new=T)
    barplot(toolValues, main="", xlim=c(0, nrow(df)+5), axes=F, horiz=TRUE, col="grey40")
    par(new=F)
    text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
  }
  
  plotNames[['Modeling.tool']] <- 'd) Modeling tool'
  plotFunctions[['Modeling.tool']] <- function(plotTitle) {
    values <- c(7, 14, 17, 2, 2, 2, 3, 4, 10, 19)
    toolValues <- c(0, 1, 10, 1, 1, 1, 1, 1, 1, 4)
    categories <- c("No information", "Tool independent", "Other tools", "CHESS", "Sparx Enterprise Architect", "IBM Rational Rose", "Artisan Real-Time Studio", "IBM Rational Soft. Architect", "Eclipse UML2", "Eclipse Papyrus")
    plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
    par(new=T)
    barplot(toolValues, main="", xlim=c(0, nrow(df)+5), axes=F, horiz=TRUE, col="grey40")
    par(new=F)
    text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
  }
  
  plotNames[['fUML']] <- 'e) Based on the fUML standard'
  plotValues[['fUML']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['fUML']] <- c(1,2)
  plotTools[['fUML']] <- c("YES"=5, "NO"=14)
  
  plotNames[['MDA.levels.covered']] <- 'f) MDA levels covered'
  # plotValues[['MDA.levels.covered']] <- c("PIM"="PIM", "PSM"="PSM", "HW"="HW")
  # plotOrders[['MDA.levels.covered']] <- c(1,3,2)
  plotFunctions[['MDA.levels.covered']] <- function(plotTitle) {
    values <- c(17, 37, 80)
    toolValues <- c(2, 12, 18)
    categories <- c("HW", "PSM", "PIM")
    plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
    par(new=T)
    barplot(toolValues, main="", xlim=c(0, nrow(df)+5), axes=F, horiz=TRUE, col="grey40")
    par(new=F)
    text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
  }
  
  plotData[['plotNames']] <- plotNames
  plotData[['plotValues']] <- plotValues
  plotData[['plotOrders']] <- plotOrders
  plotData[['plotFunctions']] <- plotFunctions
  plotData[['plotTools']] <- plotTools
  plotData[['plotDelete']] <- plotDelete
  
  # here we define the layout of the resulting plots matrix
  plotData[['numColumns']] <- 3
  plotData[['numRows']] <- 2
  
  # here we define the size and margins of the pdf being produced
  plotData[['xSize']] <- 45
  plotData[['ySize']] <- 20
  plotData[['margin']] <- 5
  plotData[['marginLeft']] <- 45
  
  plotData[['fontSize']] <- 4
  plotData[['smallFontSize']] <- 3
  
  # the file name of the pdf being produced
  plotData[['fileName']] <- "./results/facets/modeling.pdf"
  
  return(plotData)
}

generateStrategies <- function() {
  
  plotData <- list()
  
  plotNames <- list()
  plotValues <- list()
  plotOrders <- list()
  plotFunctions <- list()
  plotTools <- list()
  
  #plotNames[['Translation.steps']] <- 'a) Translation - Translation steps'
  #plotValues[['Translation.steps']] <- c("3"="3", "2"="2", "1"="1", "?"="-")
  #plotOrders[['Translation.steps']] <- c(4, 3, 2, 1)
  
  # plotNames[['Intermediate.artifacts']] <- 'b) Translation - Intermediate artifacts'
  # plotFunctions[['Intermediate.artifacts']] <- function(plotTitle) {
  #   values <- c(7, 2, 3, 4, 5, 7)
  #   categories <- c("Other", "SystemC", "Java", "XML", "UML", "Domain-specific language")
  #   plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
  #   text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
  # }
  
  plotNames[['Translation.targets']] <- 'a) Translation - Translation targets'
  plotFunctions[['Translation.targets']] <- function(plotTitle) {
    values <- c(30, 2, 2, 2, 2, 2, 4, 5, 5, 6, 7, 13, 23, 26)
    toolValues <- c(5, 1, 0, 2, 0, 2, 1, 4, 4, 1, 2, 7, 14, 10)
    categories <- c("Other", "Visual Basic", "IEC 61131-3 code", "PHP", "Petri net", "Python", "XML", "Ada", "C#", "VHDL", "SystemC", "C", "C++", "Java")
    plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
    par(new=T)
    barplot(toolValues, main="", xlim=c(0, nrow(df)+5), axes=F, horiz=TRUE, col="grey40")
    par(new=F)
    text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
  }
  
  plotNames[['Software.platform']] <- 'b) Translation - Software platform'
  plotValues[['Software.platform']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['Software.platform']] <- c(1,2)
  plotTools[['Software.platform']] <- c("YES"=12, "NO"=5)
  
  plotNames[['Traceability.links.support']] <- 'c) Traceability link support'
  plotValues[['Traceability.links.support']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['Traceability.links.support']] <- c(1,2)
  plotTools[['Traceability.links.support']] <- c("YES"=10, "NO"=7)
  
#   plotNames[['Interpretation.engine']] <- 'f) Interpretation Engine'
  #plotValues[['Interpretation.engine']] <- c("YES"="Yes", "NO"="No")
  #plotOrders[['Interpretation.engine']] <- c(1,2)
  
#   plotNames[['Compiler']] <- 'g) Compilation - Compiler'
#   #plotValues[['Compiler']] <- c("YES"="Yes", "NO"="No")
#   #plotOrders[['Compiler']] <- c(1,2)
#   
#   plotNames[['Target.platforms']] <- 'h) Compilation - Target platforms'
#   #plotValues[['Target.platforms']] <- c("YES"="Yes", "NO"="No")
#   #plotOrders[['Target.platforms']] <- c(1,2)
  
  plotNames[['Execution.tools.and.technologies']] <- 'd) Execution tools and technologies'
  plotFunctions[['Execution.tools.and.technologies']] <- function(plotTitle) {
    values <- c(47, 2, 2, 2, 3, 3, 4, 5, 5, 5, 9, 40)
    toolValues <- c(6, 0, 0, 0, 1, 1, 0, 2, 1, 1, 0, 14)
    categories <- c("Other", "hif", "fumlvm", "C", "XML-based tool", "xpand", "XSLT", "C++", "QVT", "Acceleo", "Eclipse UML2-based tool", "Java")
    plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
    par(new=T)
    barplot(toolValues, main="", xlim=c(0, nrow(df)+5), axes=F, horiz=TRUE, col="grey40")
    par(new=F)
    text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
  }
  
  plotNames[['Model.level.debugging']] <- 'e) Model-level interactive debugging'
  plotValues[['Model.level.debugging']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['Model.level.debugging']] <- c(1,2)
  plotTools[['Model.level.debugging']] <- c("YES"=12, "NO"=7)
  
  plotNames[['Simulation']] <- 'f) Support for simulation'
  plotValues[['Simulation']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['Simulation']] <- c(1,2)
  plotTools[['Simulation']] <- c("YES"=12, "NO"=7)
  
  # plotNames[['Formal.specification.languages']] <- 'h) Formal specification languages'
  #plotValues[['Formal.specification.languages']] <- c("YES"="Yes", "NO"="No")
  #plotOrders[['Formal.specification.languages']] <- c(1,2)
  
  plotNames[['Production.system']] <- 'g) Production system'
  plotValues[['Production.system']] <- c("YES"="Yes", "NO"="No")
  plotOrders[['Production.system']] <- c(1,2)
  plotTools[['Production.system']] <- c("YES"=15, "NO"=4)
  
  plotData[['plotNames']] <- plotNames
  plotData[['plotValues']] <- plotValues
  plotData[['plotOrders']] <- plotOrders
  plotData[['plotFunctions']] <- plotFunctions
  plotData[['plotTools']] <- plotTools
  
  # here we define the layout of the resulting plots matrix
  plotData[['numColumns']] <- 3
  plotData[['numRows']] <- 3
  
  # here we define the size and margins of the pdf being produced
  plotData[['xSize']] <- 45
  plotData[['ySize']] <- 23
  plotData[['margin']] <- 5
  plotData[['marginLeft']] <- 40
  
  plotData[['fontSize']] <- 4
  plotData[['smallFontSize']] <- 3
  
  plotData[['fileName']] <- "./results/facets/strategies.pdf"
  
  return(plotData)
}

generateEvidence <- function() {
  
  plotData <- list()
  
  plotNames <- list()
  plotValues <- list()
  plotOrders <- list()
  plotFunctions <- list()
  plotTools <- list()
  
#   - "Applied.research.methods"
#   - "Type.of.evidence.by.category"
#   - "Type.of.evaluation.systems"
#   - "Type.of.limitations.and.unsolved.challenges"
  
  plotNames[['Applied.research.methods']] <- 'a) Applied Research Method'
  plotValues[['Applied.research.methods']] <- c("VALID"="Validation", "EVAL"="Evaluation")
  #plotOrders[['Applied.research.methods']] <- c(1,2)

  plotNames[['Type.of.evidence.by.category']] <- 'b) Type of evidence'
  plotValues[['Type.of.evidence.by.category']] <- c("EXAMPLE"="Example", "SET_OF_EXAMPLES"="Set of examples", "EMPIRICAL_LAB"="Empirical experiment in the lab", "INDUSTRIAL_EXAMPLE"="Example from industry", "SET_OF_INDUSTRIAL_EXAMPLES"="Set of examples from industry", "EMPIRICAL_INDUSTRIAL"="Industrial empirical experiment", "INDUSTRIAL_EVALUATION"="Industrial evaluation")
  plotOrders[['Type.of.evidence.by.category']] <- c(4,1,7,2,5,6,3)
#   plotFunctions[['Execution.tools.and.technologies']] <- function(plotTitle) {
#     values <- c(47, 2, 2, 2, 2, 2, 2, 3, 5, 5, 5, 32)
#     categories <- c("Other", "XSLT", "XML-based tool", "hif", "fumlvm", "C", "C++", "xpand", "Eclipse UML2-based tool", "QVT", "Acceleo", "Java")
#     plot <- barplot(values, names.arg=categories, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
#     text(x=values + 3, y = plot, labels=as.factor(values), xpd=TRUE, cex=plotData[['fontSize']], col = "black")
#   }
  
  plotNames[['Type.of.evaluation.systems']] <- 'c) Type of system for evidence'
  plotValues[['Type.of.evaluation.systems']] <- c("web"="Web", 
                                                  "synthetic"="Synthetic",
                                                  "sensing"="Monitoring and sensing",
                                                  "mobile_robot"="Mobile robotic system",
                                                  "mobile_app"="Mobile app",
                                                  "media_converter"="Media converter",
                                                  "math_functions"="Mathematical function",
                                                  "manufacturing"="Manufacturing",
                                                  "language"="Modeling language",
                                                  "information_system"="Information system",
                                                  "controller"="Controller",
                                                  "consumer_electronics"="Consumer electronics",
                                                  "communication"="Communication",
                                                  "business_process"="Business processes"
                                                  )
  plotOrders[['Type.of.evaluation.systems']] <- c(8,14,6,10,3,5,12,1,7,9,11,2,4,13)
  
  #plotNames[['Type.of.limitations.and.unsolved.challenges']] <- 'c) Limitations and needs for improvement'
  # plotValues[['Type.of.limitations.and.unsolved.challenges']] <- c("F_traceability"="Traceability enhancement", 
  #                                                 "F_tool_enhancement"="Tool enhancement",
  #                                                 "F_scalability"="Scalabiltiy",
  #                                                 "F_runtime_model_update"="Support for runtime models update",
  #                                                 "F_reusability"="Reusability enhancement",
  #                                                 "F_portability_enhancement"="Portability enhancement",
  #                                                 "F_platform_independence"="Platform independence enhancement",
  #                                                 "F_platform_improvement"="Execution platform improvement",
  #                                                 "F_model_checking"="Support for model checking",
  #                                                 "F_expressiveness"="Expressiveness enhancement",
  #                                                 "F_execution_strategy_combination"="Execution strategies combination",
  #                                                 "F_execution_correctness"="Execution correctness assessment",
  #                                                 "F_code_optimization"="Generated code optimization",
  #                                                 "F_additional_uml_coverage"="Better coverage of UML",
  #                                                 "F_additional_evaluation"="Additional evaluation",
  #                                                 "F_additional_analysis"="Additional analysis of models",
  #                                                 "A_platform_issues"="Platform-specific limitations"
  #                                                 )
  #plotOrders[['Type.of.limitations.and.unsolved.challenges']] <- c(15,7,12,11,13,1,14,5,6,10,17,9,3,2,4,16,8)
  
  plotData[['plotNames']] <- plotNames
  plotData[['plotValues']] <- plotValues
  plotData[['plotOrders']] <- plotOrders
  plotData[['plotFunctions']] <- plotFunctions
  plotData[['plotTools']] <- plotTools
  
  # here we define the layout of the resulting plots matrix
  plotData[['numColumns']] <- 3
  plotData[['numRows']] <- 1
  
  # here we define the size and margins of the pdf being produced
  plotData[['xSize']] <- 45
  plotData[['ySize']] <- 12
  plotData[['margin']] <- 5
  plotData[['marginLeft']] <- 20
  
  plotData[['fontSize']] <- 4
  plotData[['smallFontSize']] <- 3
  
  plotData[['fileName']] <- "./results/facets/evidence.pdf"
  
  return(plotData)
}

generateLimitations <- function() {
  
  plotData <- list()
  
  plotNames <- list()
  plotValues <- list()
  plotOrders <- list()
  plotFunctions <- list()
  plotTools <- list()
  
  plotNames[['Type.of.limitations.and.unsolved.challenges']] <- ''
  plotValues[['Type.of.limitations.and.unsolved.challenges']] <- c("F_traceability"="Traceability enhancement",
                                                  "F_tool_enhancement"="Tool enhancement",
                                                  "F_scalability"="Scalabiltiy",
                                                  "F_runtime_model_update"="Support for runtime models update",
                                                  "F_reusability"="Reusability enhancement",
                                                  "F_portability_enhancement"="Portability enhancement",
                                                  "F_platform_independence"="Platform independence enhancement",
                                                  "F_platform_improvement"="Execution platform improvement",
                                                  "F_model_checking"="Support for model checking",
                                                  "F_expressiveness"="Expressiveness enhancement",
                                                  "F_execution_strategy_combination"="Execution strategies combination",
                                                  "F_execution_correctness"="Execution correctness assessment",
                                                  "F_code_optimization"="Generated code optimization",
                                                  "F_additional_uml_coverage"="Better coverage of UML",
                                                  "F_additional_evaluation"="Additional evaluation",
                                                  "F_additional_analysis"="Additional analysis of models",
                                                  "A_platform_issues"="Platform-specific limitations"
                                                  )
  plotOrders[['Type.of.limitations.and.unsolved.challenges']] <- c(15,7,12,11,13,1,14,5,6,10,17,9,3,2,4,16,8)
  # to modify graphically to make it 0: all but F_expressiveness, F_model_checking, F_additional_analysis
  plotTools[['Type.of.limitations.and.unsolved.challenges']] <- c("F_traceability"=1,
                                 "F_tool_enhancement"=1,
                                 "F_scalability"=1,
                                 "F_runtime_model_update"=1,
                                 "F_reusability"=1,
                                 "F_portability_enhancement"=1,
                                 "F_platform_independence"=1,
                                 "F_platform_improvement"=1,
                                 "F_model_checking"=1,
                                 "F_expressiveness"=2,
                                 "F_execution_strategy_combination"=1,
                                 "F_execution_correctness"=1,
                                 "F_code_optimization"=1,
                                 "F_additional_uml_coverage"=1,
                                 "F_additional_evaluation"=1,
                                 "F_additional_analysis"=3,
                                 "A_platform_issues"=1
  )
  
  plotData[['plotNames']] <- plotNames
  plotData[['plotValues']] <- plotValues
  plotData[['plotOrders']] <- plotOrders
  plotData[['plotFunctions']] <- plotFunctions
  plotData[['plotTools']] <- plotTools
  
  # here we define the layout of the resulting plots matrix
  plotData[['numColumns']] <- 1
  plotData[['numRows']] <- 1
  
  # here we define the size and margins of the pdf being produced
  plotData[['xSize']] <- 24
  plotData[['ySize']] <- 15
  plotData[['margin']] <- 5
  plotData[['marginLeft']] <- 57
  
  plotData[['fontSize']] <- 3.8
  plotData[['smallFontSize']] <- 3
  
  plotData[['fileName']] <- "./results/limitations.pdf"
  
  return(plotData)
}

############# DO NOT CHANGE ANYTHING BELOW THIS LINE ############# 

# here we select which data frame is containing all the data
extractedData <- read.delim("../rawData/extractedData.txt", header = TRUE, quote = "\"", dec = ".", fill = TRUE, comment.char = "", na.strings = "N/A")
dataSource <- extractedData
# we remove all the potential columns containing all NAs 
# (this may happen because of some strange things that Excel does 
# when exporting towards tab-delimited textual files)
dataSource <- dataSource[,colSums(is.na(dataSource))<nrow(dataSource)]

# separator used in categorical variables with multiple values
separator <- '#'

df <- dataSource

#plotData <- generateExecution()
#plotData <- generateModeling()
plotData <- generateStrategies()

#plotData <- generateEvidence()

# The following call is legacy from the previous submission
#plotData <- generateLimitations()

library(splitstackshape)
library(plyr)
dt2 <- cSplit(df, splitCols=names(df), sep=separator, direction="long")
dt2 <- dt2[!duplicated(dt2), ]

ind <- apply(dt2, 1, function(x) all(is.na(x)))
dt2 <- dt2[ !ind, ]

index = 1
for(i in 1:nrow(dt2)) {
  row <- dt2[i,]
  if(is.na(row$ID)) {
    dt2[[i,1]] <- dt2[[i-1,1]]
  } else {
    index <- i
  }
}

pdf(plotData[['fileName']], width=plotData[['xSize']], height=plotData[['ySize']])
par(mar=c(plotData[['margin']], plotData[['marginLeft']], plotData[['margin']], plotData[['margin']]))
par(mfrow=c(plotData[['numRows']], plotData[['numColumns']]))
par(las=1)

indexes <- c(1:length(names(dt2)))
# adjustments ad-hoc
# 41-34
temp <- indexes[41]
indexes[41] <- indexes[34]
indexes[34] <- temp
# 38-35
temp <- indexes[38]
indexes[38] <- indexes[35]
indexes[35] <- temp
# 40-36
temp <- indexes[40]
indexes[40] <- indexes[36]
indexes[36] <- temp
# 37-39
temp <- indexes[39]
indexes[39] <- indexes[37]
indexes[37] <- temp
# 42-35
temp <- indexes[42]
indexes[42] <- indexes[38]
indexes[38] <- temp
# 43-37
temp <- indexes[43]
indexes[43] <- indexes[39]
indexes[39] <- temp
# # 36-35
temp <- indexes[40]
indexes[40] <- indexes[42]
indexes[42] <- temp
# # 36-34
temp <- indexes[42]
indexes[42] <- indexes[41]
indexes[41] <- temp
# 34-37
temp <- indexes[42]
indexes[42] <- indexes[45]
indexes[45] <- temp
# 48-19
temp <- indexes[19]
indexes[19] <- indexes[48]
indexes[48] <- temp
# 48-45
temp <- indexes[48]
indexes[48] <- indexes[45]
indexes[45] <- temp
# 46-19
temp <- indexes[19]
indexes[19] <- indexes[46]
indexes[46] <- temp

reorderCounts <- function(arr, v) {
  result <- c()
  for(i in 1:length(arr)) {
    result[i] <- arr[plotData[['plotOrders']][[v]][i]]
  }
  return(result)
}

reorderTools <- function(arr, v) {
  result <- c()
  for(i in 1:length(arr)) {
    result[i] <- arr[plotData[['plotOrders']][[v]][i]]
  }
  return(result)
}

roll <- function(toRoll) {
  result <- c()
  for(i in 1:length(toRoll)) {
    currentName <- names(toRoll)[i]
    result <- append(result, rep(currentName, toRoll[i]))
  }  
  return(as.factor(result))
}

for(i in indexes) {
  var <- names(df)[i]
  if(!is.null(plotData[['plotNames']][[var]])) {
    plotTitle <- plotData[['plotNames']][[var]]
    if(!is.null(plotData[['plotFunctions']][[var]])) {
      plotData[['plotFunctions']][[var]](plotTitle)
    } else {
      toPlot <- as.factor(dt2[[var]])
      if(!is.null(plotData[['plotValues']][[var]])) {
        toPlot <- revalue(toPlot, plotData[['plotValues']][[var]])
        if(!is.null(plotData[['plotOrders']][[var]])) {
          toPlot <- factor(toPlot,levels(toPlot)[plotData[['plotOrders']][[var]]])
        }
      }
      counts <- count(dt2, var)$freq[1:length(count(dt2, var)$freq)-1]
      if(!is.null(plotData[['plotOrders']][[var]])) {
        counts <- reorderCounts(counts, var)
      }
      counts2 <- count(dt2, var)$freq + 2.4
      if(!is.null(plotData[['plotOrders']][[var]])) {
        counts2 <- reorderCounts(counts2, var)
      }
      plot <- plot(toPlot, main=plotTitle, cex.main=plotData[['fontSize']], xlim=c(0, nrow(df)+5), cex=plotData[['smallFontSize']], cex.names=plotData[['fontSize']], horiz=TRUE)
      par(new=T)
      
      # here we plot also the values for the tools
      #tools <- as.factor(unique(plotData[['plotValues']][[var]]))
      
      #if(plotTitle == "a) Execution strategy") {
      if(!is.null(plotData[['plotTools']][[var]])) { 
        tools <- roll(plotData[['plotTools']][[var]])
        if(!is.null(plotData[['plotOrders']][[var]])) {
          tools <- factor(tools,levels(tools)[plotData[['plotOrders']][[var]]])
        }
        plot(tools, main="", xlim=c(0, nrow(df)+5), axes=F, horiz=TRUE, col="grey40")
      }
      par(new=F)
      text(x=counts2, y = plot, label = counts, cex = plotData[['fontSize']], col = "black")
      print(paste(plotTitle, " - plotted")) 
    }
  }
}
#plotData[['plotAdditionalFacets']]()

dev.off()
