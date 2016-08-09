// Copyright 2016 Cheng Zhao. All rights reserved.
// Use of this source code is governed by the MIT license that can be
// found in the LICENSE file.

#include "base/bind.h"
#include "base/command_line.h"
#include "base/logging.h"
#include "lua/callback.h"

void PMain() {
}

int main(int argc, const char *argv[]) {
  base::CommandLine::Init(argc, argv);

  logging::LoggingSettings settings;
  settings.logging_dest = logging::LOG_TO_SYSTEM_DEBUG_LOG;
  logging::InitLogging(settings);

  lua::MangedState state;
  if (!state) {
    LOG(ERROR) << "Failed to create state.";
    return 1;
  }

  if (!lua::PCall(state, base::Bind(&PMain))) {
    LOG(ERROR) << "PMain failed.";
    return 2;
  }

  return 0;
}
