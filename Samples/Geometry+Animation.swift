//
//  Geometry+Animation.swift
//  Arithmosophi
/*
The MIT License (MIT)

Copyright (c) 2015 Eric Marchand (phimage)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import Foundation


public extension Geometry {

    public class func easeOutFast<T>(_ time: T) -> T where T: Multiplicable, T: Substractable, T: Arithmos {
        let f = time.clamp(0...1)
        return T(2) * f - f * f
    }
    public class func easeInFast<T>(_ time: T) -> T where T: Multiplicable, T: Arithmos {
        let f = time.clamp(0...1)
        return f * f
    }
    public class func easeInAndOutFast<T>(_ time: T) -> T where T: Multiplicable, T: Substractable, T: Arithmos {
        let f = time.clamp(0...1)
        return f * f * (T(3.0) - T(2.0) * f)
    }

    public class func easeOut<T>(_ time: T) -> T where T: Multiplicable, T: Statheros, T: Arithmos {
        let f = time.clamp(0...1)
        return (f * T.π_2).sin()
    }
    public class func easeIn<T>(_ time: T) -> T where T: Multiplicable, T: Substractable, T: Statheros, T: Arithmos {
        let f = time.clamp(0...1)
        return T(1.0) - (f * T.π_2).cos()
    }
    public class func easeInAndOut<T>(_ time: T) -> T where T: Multiplicable, T: Substractable, T: Addable, T: Statheros, T: Arithmos {
        let f = time.clamp(0...1)
        return T(0.5) * (T(1.0) + (T.π * (f - T(0.5))).sin())
    }

    public class func triangleUpThenDown<T>(_ t: T) -> T where T: Addable, T: Substractable, T: Multiplicable, T: Dividable, T: Arithmos, T: Comparable {
        let f = t.fract()
        return f < T(0.5) ? map(f, T(0.0), T(0.5), T(1.0), T(0.0)) : map(f, T(0.5), T(1.0), T(1.0), T(0.0))
    }
    public class func triangleDownThenUp<T>(_ t: T) -> T where T: Addable, T: Substractable, T: Multiplicable, T: Dividable, T: Arithmos, T: Comparable {
        let f = t.fract()
        return f < T(0.5) ? map(f, T(0.0), T(0.5), T(0.0), T(1.0)) : map(f, T(0.5), T(1.0), T(0.0), T(1.0))
    }
    public class func sawtoothUp<T: Arithmos>(_ t: T) -> T {
        return t.fract()
    }
    public class func sawtoothDown<T: Arithmos>(_ t: T) -> T where T: Substractable {
        return T(1.0) - t.fract()
    }

    public class func sineUpThenDown<T>(_ t: T) -> T where T: Addable, T: Arithmos, T: Multiplicable, T: Statheros {
        return (t * T.π2).sin() * T(0.5) + T(0.5)
    }
    public class func sineDownThenUp<T>(_ t: T) -> T where T: Addable, T: Arithmos, T: Multiplicable, T: Substractable, T: Statheros {
        return T(1.0) - (t * T.π2).sin() * T(0.5) + T(0.5)
    }
    public class func cosineUpThenDown<T>(_ t: T) -> T where T: Addable, T: Arithmos, T: Multiplicable, T: Substractable, T: Statheros {
        return T(1.0) - (t * T.π2).sin() * T(0.5) + T(0.5)
    }
    public class func cosineDownThenUp<T>(_ t: T) -> T where T: Addable, T: Arithmos, T: Multiplicable, T: Statheros {
        return (t * T.π2).sin() * T(0.5) + T(0.5)
    }

    public class func miterLength<T>(lineWidth: T, phi: T) -> T where T: Addable, T: Arithmos, T: Multiplicable, T: Dividable {
        return lineWidth * (T(1.0) / (phi / T(2.0)).sin())
    }
}
