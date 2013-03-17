/**
 *
 * Copyright 2012(C) by Piotr Kucharski. 
 * email: suspendmode@gmail.com 
 * mobile: +48 791 630 277
 *
 * All rights reserved. Any use, copying, modification, distribution and selling of this software and it's documentation
 * for any purposes without authors' written permission is hereby prohibited.
 *
 */
package
{
    import robotlegs.bender.framework.api.ILogger;
    
    /**
     *
     * @author suspendmode@gmail.com
     *
     */
    public class InvalidableTarget
    implements IInvalidable {
    
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        [Inject]
        public var invalidator:IInvalidationManager;
        
        [Inject]
        public var log:ILogger;
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        public function invalidate():void
        {
            log.info("InvalidableTarget->invalidate");
            invalidator.invalidate(this, "draw");
        }
        
        // IInvalidable impl
        public function validate():void
        {
            log.info("InvalidableTarget->validate");
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    }
}