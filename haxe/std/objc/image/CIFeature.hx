/* CoreImage - CIFeature.h

   Copyright (c) 2011 Apple, Inc.
   All rights reserved. */

#import <CoreImage/CoreImageDefines.h>
#import <Foundation/Foundation.h>


/** Generic feature found by a CIDetector. */
CORE_IMAGE_CLASS_EXPORT
extern class CIFeature extends NSObject {}

/** The type of the feature. */
	public var (default, null) NSString *type;
/** The bounds of the feature in the image it was detected in. */
	public var (default, null) CGRect bounds;

}


/** Specifies the type of a feature that is a face. */
CORE_IMAGE_EXPORT NSString* const CIFeatureTypeFace;


/** A face feature found by a CIDetector.
 All positions are relative to the original image. */
CORE_IMAGE_CLASS_EXPORT
extern class CIFaceFeature : CIFeature {}

/** coordinates of various cardinal points within a face.
 
 Note that the left eye is the eye on the left side of the face
 from the observer's perspective. It is not the left eye from
 the subject's perspective. */

	public var (default, null) BOOL hasLeftEyePosition;
	public var (default, null) CGPoint leftEyePosition;
	public var (default, null) BOOL hasRightEyePosition;
	public var (default, null) CGPoint rightEyePosition;
	public var (default, null) BOOL hasMouthPosition;
	public var (default, null) CGPoint mouthPosition;

	public var (default, null) BOOL hasTrackingID;
	public var (default, null) int trackingID;
	public var (default, null) BOOL hasTrackingFrameCount;
	public var (default, null) int trackingFrameCount;

}

