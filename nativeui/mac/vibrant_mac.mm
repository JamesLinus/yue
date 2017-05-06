// Copyright 2017 Cheng Zhao. All rights reserved.
// Use of this source code is governed by the license that can be found in the
// LICENSE file.

#include "nativeui/vibrant.h"

#include "base/mac/sdk_forward_declarations.h"
#include "nativeui/mac/container_mac.h"

@interface NUVibrant : NSVisualEffectView<NUView> {
 @private
  nu::NUPrivate private_;
}
- (nu::NUPrivate*)nuPrivate;
- (void)setNUBackgroundColor:(nu::Color)color;
@end

@implementation NUVibrant

- (nu::NUPrivate*)nuPrivate {
  return &private_;
}

- (void)setNUBackgroundColor:(nu::Color)color {
}

- (BOOL)isFlipped {
  return YES;
}

@end

namespace nu {

// static
const char Vibrant::kClassName[] = "Vibrant";

Vibrant::Vibrant() : Container("an_empty_constructor") {
  TakeOverView([[NUVibrant alloc] init]);
}

Vibrant::~Vibrant() {
}

const char* Vibrant::GetClassName() const {
  return kClassName;
}

}  // namespace nu
