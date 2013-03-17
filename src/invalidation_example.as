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
    import flash.display.Sprite;
    import flash.ui.Keyboard;
    
    import robotlegs.bender.bundles.mvcs.MVCSBundle;
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.api.ILogger;
    import robotlegs.bender.framework.api.LogLevel;
    import robotlegs.bender.framework.impl.Context;
    import robotlegs.suspendmode.keyboard.KeyboardManagerExtension;
    import robotlegs.suspendmode.keyboard.api.IKeyboardManager;
    
    
    /**
     *
     * @author suspendmode@gmail.com
     *
     */
    public class invalidation_example extends Sprite
    {
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        private var context:IContext;
        
        private var log:ILogger;
        
        public function invalidation_example()
        {
            context=new Context();
            
            context.install(InvalidationExtension);
            context.configure(new ContextView(this));
            
            context.injector.map(GenericTarget).toType(GenericTarget);
            context.injector.map(InvalidableTarget).toType(InvalidableTarget);

            log=context.getLogger(this);
            context.logLevel=LogLevel.INFO;
            context.initialize(onInitialize);
        }
        
        private function onInitialize():void
        {
            var o1: IInvalidable = context.injector.getInstance(InvalidableTarget);
            o1.invalidate();
            o1.invalidate();
            
            var o2: Object = context.injector.getInstance(GenericTarget);
            o2.invalidate();
            o2.invalidate();
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    }
}
