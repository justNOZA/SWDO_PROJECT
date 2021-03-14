create 
    table 
    userinfo (
        nickname varchar2(50) not null unique
        , id varchar2(50) primary key
        , password varchar2(75) not null
        , name varchar2(50) not null
        , gender number default 0
        , email varchar2(100)
        , birthday date default sysdate
    );

create 
    table
    card (
        cardnum number primary key
        , card_corporation varchar2(50) not null
    );
        
create
    sequence
    card_seq;

create
    table
    group_user (
    groupnum number primary key
    , groupname varchar2(100) not null
    , groupintroduce varchar2(1000)
    );
    
create
    sequence
    group_user_seq;
        
create
    table
    ebooknum (
    booknum number primary key
    , title varchar2(100) not null
    , title2 varchar2(100) not null
    , author varchar2(100)not null
    , publisher varchar2(100) not null
    );

create 
    sequence
    ebooknum_seq;

create
    table
    reply_book (
    replynum number primary key
    , point number default 0
    , title varchar2(100) not null
    , content varchar2(2000) not null
    , inputdate date default sysdate
    , publisher varchar2(100) not null
    , nickname varchar2(20) not null
    , id varchar2(50) not null
    , FOREIGN key (nickname) references userinfo(nickname) on delete cascade
    , FOREIGN key (id) references userinfo(id) on delete cascade
    ); 
create
    sequence
    reply_book_seq;

create
    table
    used_data (
    search varchar2(100)
    , buy number 
    , nickname varchar2(20) not null
    , id varchar2(50) not null
    , FOREIGN key (nickname) references userinfo(nickname) on delete cascade
    , FOREIGN key (id) references userinfo(id) on delete cascade
    );
    
create
    table
    readbook (
    inputdate date default sysdate
    , storage varchar2(4000)
    , bookmarks varchar2(2000)
    , annotations varchar2(2000)
    , booknum number not null
    , nickname varchar2(20) not null
    , id varchar2(50) not null
    , FOREIGN key (booknum) references ebooknum(booknum) on delete cascade
    , FOREIGN key (nickname) references userinfo(nickname) on delete cascade
    , FOREIGN key (id) references userinfo(id) on delete cascade
    ); 
    
create
    table
    buy_user (
    inputdate date default sysdate
    , day number default 0
    , want number default 0
    , cardnum number default 0
    , booknum number not null
    , nickname varchar2(20) not null
    , id varchar2(50) not null
    , FOREIGN key (cardnum) references card(cardnum) on delete cascade
    , FOREIGN key (booknum) references ebooknum(booknum) on delete cascade
    , FOREIGN key (nickname) references userinfo(nickname) on delete cascade
    , FOREIGN key (id) references userinfo(id) on delete cascade
    ); 
    
create
    table
    community (
    group_master number default 0
    , groupname varchar2(100) not null
    , groupintroduce varchar2(1000) not null
    , nickname varchar2(20) not null
    , id varchar2(50) not null
    , groupnum number not null
    , FOREIGN key (groupnum) references group_user(groupnum) on delete cascade
    , FOREIGN key (nickname) references userinfo(nickname) on delete cascade
    , FOREIGN key (id) references userinfo(id) on delete cascade
    ); 
    
create
    table
    groupboard (
    bnum_group number primary key
    , title varchar2(200) not null
    , content varchar2(2000) not null
    , inputdate date default sysdate
    , groupname varchar2(100) not null
    , nickname varchar2(20) not null
    , id varchar2(50) not null
    , groupnum number not null
    , FOREIGN key (groupnum) references group_user(groupnum) on delete cascade
    , FOREIGN key (nickname) references userinfo(nickname) on delete cascade
    , FOREIGN key (id) references userinfo(id) on delete cascade
    ); 
    
create
    sequence
    groupboard_seq;

create
    table
    groupreply(
    rnum_group number primary key
    , content varchar2(2000) not null
    , inputdate date default sysdate
    , bnum_group number not null
    , nickname varchar2(20) not null
    , id varchar2(50) not null
    , groupnum number not null
    , FOREIGN key (bnum_group) references groupboard(bnum_group) on delete cascade
    , FOREIGN key (groupnum) references group_user(groupnum) on delete cascade
    , FOREIGN key (nickname) references userinfo(nickname) on delete cascade
    , FOREIGN key (id) references userinfo(id) on delete cascade
    ); 
create 
    sequence
    groupreply_seq;