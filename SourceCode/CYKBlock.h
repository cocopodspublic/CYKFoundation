//
//  CYKBlock.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#ifndef CYKBlock_h
#define CYKBlock_h

typedef void (^voidBlock)(void);
typedef void (^idBOOLBlock)( id content, BOOL direction);
typedef void (^idRange3Block)( id content1, id content2, id content3);
typedef void (^intBlock)(int flag);
typedef void (^refreshContent)(NSString *name);


#endif /* CYKBlock_h */
