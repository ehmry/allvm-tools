set(LLVM_LINK_COMPONENTS
  ${LLVM_TARGETS_TO_BUILD}
  Analysis
  AsmPrinter
  CodeGen
  Core
  IRReader
  MC
  MIRParser
  ScalarOpts
  SelectionDAG
  Support
  Target
  TransformUtils
)

add_allvm_library(AOTCompile
  AOTCompile.cpp
  LINK_LIBS Cache StaticCodeGen
)

add_definitions(${LLVM_DEFINITIONS})
