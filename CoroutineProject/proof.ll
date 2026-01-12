; ModuleID = 'CoroutineProject.cpp'
source_filename = "CoroutineProject.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.44.35222"

%"class.std::basic_ostream" = type { ptr, [4 x i8], i32, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, ptr, i8 }
%"class.std::ios_base" = type { ptr, i64, i32, i32, i32, i64, i64, ptr, ptr, ptr }
%struct.Task = type { %"struct.std::coroutine_handle" }
%"struct.std::coroutine_handle" = type { ptr }
%"class.std::basic_ostream<char>::sentry" = type { %"class.std::basic_ostream<char>::_Sentry_base", i8 }
%"class.std::basic_ostream<char>::_Sentry_base" = type { ptr }
%struct.WSAData = type { i16, i16, i16, i16, ptr, [257 x i8], [129 x i8] }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { %union.anon }
%union.anon = type { i32 }

$"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z" = comdat any

$"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ" = comdat any

$"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ" = comdat any

$_Avx2WmemEnabledWeakValue = comdat any

$"??_C@_0CC@CIJDCBME@?$FLCRITICAL?$FN?5Out?5of?5static?5memory?$CB@" = comdat any

$"??_C@_04FMMHFHOO@?$AN?6?$AN?6?$AA@" = comdat any

$"??_C@_0CB@PBFOGNMP@?$FLSERVER?$FN?5Full?5request?5received?4?6@" = comdat any

$"??_C@_03HAPOJHBM@GET?$AA@" = comdat any

$"??_C@_0BJ@FAGIGACG@?$FLSERVER?$FN?5Task?5finished?4?6?$AA@" = comdat any

$"??_C@_0DC@EGHDJLEA@?9?9?9?5HTTP?5Server?5?$CIAsync?1Non?9Block@" = comdat any

$"??_C@_0CA@ICOMKMBL@?$FLSCHEDULER?$FN?5New?5client?5in?5slot?5?$AA@" = comdat any

$"??_C@_01EEMJAFIK@?6?$AA@" = comdat any

$"??_C@_0CP@BDLKAANJ@?$FLSCHEDULER?$FN?5Server?5full?0?5droppin@" = comdat any

$"??_C@_0GC@OHIFMJHH@HTTP?11?40?5200?5OK?$AN?6Content?9Type?3?5t@" = comdat any

@_Avx2WmemEnabledWeakValue = weak_odr dso_local local_unnamed_addr global i32 0, comdat, align 4
@pool_offset = internal unnamed_addr global i64 0, align 8
@"?cerr@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A" = external dllimport global %"class.std::basic_ostream", align 8
@"??_C@_0CC@CIJDCBME@?$FLCRITICAL?$FN?5Out?5of?5static?5memory?$CB@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"[CRITICAL] Out of static memory!\0A\00", comdat, align 1
@task_memory_pool = internal global [65536 x i8] zeroinitializer, align 16
@"??_C@_04FMMHFHOO@?$AN?6?$AN?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"\0D\0A\0D\0A\00", comdat, align 1
@"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A" = external dllimport global %"class.std::basic_ostream", align 8
@"??_C@_0CB@PBFOGNMP@?$FLSERVER?$FN?5Full?5request?5received?4?6@" = linkonce_odr dso_local unnamed_addr constant [33 x i8] c"[SERVER] Full request received.\0A\00", comdat, align 1
@"??_C@_03HAPOJHBM@GET?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"GET\00", comdat, align 1
@"??_C@_0BJ@FAGIGACG@?$FLSERVER?$FN?5Task?5finished?4?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [25 x i8] c"[SERVER] Task finished.\0A\00", comdat, align 1
@active_tasks = internal unnamed_addr global [5 x %struct.Task] zeroinitializer, align 16
@"??_C@_0DC@EGHDJLEA@?9?9?9?5HTTP?5Server?5?$CIAsync?1Non?9Block@" = linkonce_odr dso_local unnamed_addr constant [50 x i8] c"--- HTTP Server (Async/Non-Blocking) on 8080 ---\0A\00", comdat, align 1
@"??_C@_0CA@ICOMKMBL@?$FLSCHEDULER?$FN?5New?5client?5in?5slot?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [32 x i8] c"[SCHEDULER] New client in slot \00", comdat, align 1
@"??_C@_01EEMJAFIK@?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c"\0A\00", comdat, align 1
@"??_C@_0CP@BDLKAANJ@?$FLSCHEDULER?$FN?5Server?5full?0?5droppin@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"[SCHEDULER] Server full, dropping connection.\0A\00", comdat, align 1
@"??_C@_0GC@OHIFMJHH@HTTP?11?40?5200?5OK?$AN?6Content?9Type?3?5t@" = linkonce_odr dso_local unnamed_addr constant [98 x i8] c"HTTP/1.0 200 OK\0D\0AContent-Type: text/plain\0D\0AContent-Length: 13\0D\0AConnection: close\0D\0A\0D\0AHello World!\0A\00", comdat, align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_CoroutineProject.cpp, ptr null }]

; Function Attrs: mustprogress sspstrong uwtable
define dso_local noundef nonnull ptr @"?my_static_alloc@@YAPEAX_K@Z"(i64 noundef %0) local_unnamed_addr #0 {
  %2 = load i64, ptr @pool_offset, align 8
  %3 = add i64 %2, %0
  %4 = icmp ugt i64 %3, 65536
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = tail call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cerr@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0CC@CIJDCBME@?$FLCRITICAL?$FN?5Out?5of?5static?5memory?$CB@")
  tail call void @terminate() #14
  unreachable

7:                                                ; preds = %1
  %8 = getelementptr inbounds [65536 x i8], ptr @task_memory_pool, i64 0, i64 %2
  store i64 %3, ptr @pool_offset, align 8
  ret ptr %8
}

; Function Attrs: mustprogress sspstrong uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) local_unnamed_addr #0 comdat personality ptr @__CxxFrameHandler3 {
  %3 = alloca %"class.std::basic_ostream<char>::sentry", align 8
  %4 = tail call noundef i64 @strlen(ptr noundef nonnull dereferenceable(1) %1) #15
  %5 = load ptr, ptr %0, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 4
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = getelementptr inbounds i8, ptr %9, i64 40
  %11 = load i64, ptr %10, align 8
  %12 = icmp sgt i64 %11, 0
  %13 = icmp sgt i64 %11, %4
  %14 = and i1 %12, %13
  %15 = sub nsw i64 %11, %4
  %16 = select i1 %14, i64 %15, i64 0
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #15
  store ptr %0, ptr %3, align 8
  %17 = getelementptr inbounds i8, ptr %9, i64 72
  %18 = load ptr, ptr %17, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %28, label %20

20:                                               ; preds = %2
  %21 = load ptr, ptr %18, align 8
  %22 = getelementptr inbounds i8, ptr %21, i64 8
  %23 = load ptr, ptr %22, align 8
  tail call void %23(ptr noundef nonnull align 8 dereferenceable(104) %18)
  %24 = load ptr, ptr %0, align 8
  %25 = getelementptr inbounds i8, ptr %24, i64 4
  %26 = load i32, ptr %25, align 4
  %27 = sext i32 %26 to i64
  br label %28

28:                                               ; preds = %20, %2
  %29 = phi i64 [ %8, %2 ], [ %27, %20 ]
  %30 = getelementptr inbounds i8, ptr %0, i64 %29
  %31 = tail call noundef zeroext i1 @"?good@ios_base@std@@QEBA_NXZ"(ptr noundef nonnull align 8 dereferenceable(72) %30) #15
  br i1 %31, label %34, label %32

32:                                               ; preds = %28
  %33 = getelementptr inbounds i8, ptr %3, i64 8
  store i8 0, ptr %33, align 8
  br label %148

34:                                               ; preds = %28
  %35 = load ptr, ptr %0, align 8
  %36 = getelementptr inbounds i8, ptr %35, i64 4
  %37 = load i32, ptr %36, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, ptr %0, i64 %38
  %40 = getelementptr inbounds i8, ptr %39, i64 80
  %41 = load ptr, ptr %40, align 8
  %42 = icmp eq ptr %41, null
  %43 = icmp eq ptr %41, %0
  %44 = or i1 %42, %43
  br i1 %44, label %45, label %47

45:                                               ; preds = %34
  %46 = getelementptr inbounds i8, ptr %3, i64 8
  store i8 1, ptr %46, align 8
  br label %60

47:                                               ; preds = %34
  %48 = invoke noundef nonnull align 8 dereferenceable(8) ptr @"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %41)
          to label %51 unwind label %49

49:                                               ; preds = %47
  %50 = cleanuppad within none []
  call void @"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %3) #15 [ "funclet"(token %50) ]
  cleanupret from %50 unwind to caller

51:                                               ; preds = %47
  %52 = load ptr, ptr %0, align 8
  %53 = getelementptr inbounds i8, ptr %52, i64 4
  %54 = load i32, ptr %53, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, ptr %0, i64 %55
  %57 = tail call noundef zeroext i1 @"?good@ios_base@std@@QEBA_NXZ"(ptr noundef nonnull align 8 dereferenceable(72) %56) #15
  %58 = getelementptr inbounds i8, ptr %3, i64 8
  %59 = zext i1 %57 to i8
  store i8 %59, ptr %58, align 8
  br i1 %57, label %60, label %148

60:                                               ; preds = %45, %51
  %61 = load ptr, ptr %0, align 8
  %62 = getelementptr inbounds i8, ptr %61, i64 4
  %63 = load i32, ptr %62, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, ptr %0, i64 %64
  %66 = getelementptr inbounds i8, ptr %65, i64 24
  %67 = load i32, ptr %66, align 8
  %68 = and i32 %67, 448
  %69 = icmp ne i32 %68, 64
  %70 = icmp sgt i64 %16, 0
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %94

72:                                               ; preds = %60, %86
  %73 = phi i64 [ %87, %86 ], [ %15, %60 ]
  %74 = load ptr, ptr %0, align 8
  %75 = getelementptr inbounds i8, ptr %74, i64 4
  %76 = load i32, ptr %75, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, ptr %0, i64 %77
  %79 = getelementptr inbounds i8, ptr %78, i64 72
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds i8, ptr %78, i64 88
  %82 = load i8, ptr %81, align 8
  %83 = invoke noundef i32 @"?sputc@?$basic_streambuf@DU?$char_traits@D@std@@@std@@QEAAHD@Z"(ptr noundef nonnull align 8 dereferenceable(104) %80, i8 noundef %82)
          to label %84 unwind label %121

84:                                               ; preds = %72
  %85 = icmp eq i32 %83, -1
  br i1 %85, label %140, label %86

86:                                               ; preds = %84
  %87 = add nsw i64 %73, -1
  %88 = icmp sgt i64 %73, 1
  br i1 %88, label %72, label %89

89:                                               ; preds = %86
  %90 = load ptr, ptr %0, align 8
  %91 = getelementptr inbounds i8, ptr %90, i64 4
  %92 = load i32, ptr %91, align 4
  %93 = sext i32 %92 to i64
  br label %94

94:                                               ; preds = %89, %60
  %95 = phi i64 [ %93, %89 ], [ %64, %60 ]
  %96 = phi i64 [ 0, %89 ], [ %16, %60 ]
  %97 = getelementptr inbounds i8, ptr %0, i64 %95
  %98 = getelementptr inbounds i8, ptr %97, i64 72
  %99 = load ptr, ptr %98, align 8
  %100 = load ptr, ptr %99, align 8
  %101 = getelementptr inbounds i8, ptr %100, i64 72
  %102 = load ptr, ptr %101, align 8
  %103 = invoke noundef i64 %102(ptr noundef nonnull align 8 dereferenceable(104) %99, ptr noundef %1, i64 noundef %4)
          to label %104 unwind label %121

104:                                              ; preds = %94
  %105 = icmp eq i64 %103, %4
  %106 = select i1 %105, i32 0, i32 4
  %107 = icmp sgt i64 %96, 0
  %108 = select i1 %105, i1 %107, i1 false
  br i1 %108, label %109, label %140

109:                                              ; preds = %104, %137
  %110 = phi i64 [ %138, %137 ], [ %96, %104 ]
  %111 = load ptr, ptr %0, align 8
  %112 = getelementptr inbounds i8, ptr %111, i64 4
  %113 = load i32, ptr %112, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, ptr %0, i64 %114
  %116 = getelementptr inbounds i8, ptr %115, i64 72
  %117 = load ptr, ptr %116, align 8
  %118 = getelementptr inbounds i8, ptr %115, i64 88
  %119 = load i8, ptr %118, align 8
  %120 = invoke noundef i32 @"?sputc@?$basic_streambuf@DU?$char_traits@D@std@@@std@@QEAAHD@Z"(ptr noundef nonnull align 8 dereferenceable(104) %117, i8 noundef %119)
          to label %135 unwind label %121

121:                                              ; preds = %94, %109, %72
  %122 = phi i32 [ %106, %109 ], [ 0, %72 ], [ 0, %94 ]
  %123 = catchswitch within none [label %124] unwind label %179

124:                                              ; preds = %121
  %125 = catchpad within %123 [ptr null, i32 64, ptr null]
  %126 = load ptr, ptr %0, align 8
  %127 = getelementptr inbounds i8, ptr %126, i64 4
  %128 = load i32, ptr %127, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, ptr %0, i64 %129
  %131 = getelementptr inbounds i8, ptr %130, i64 16
  %132 = load i32, ptr %131, align 8
  %133 = or i32 %132, 4
  invoke void @"?clear@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"(ptr noundef nonnull align 8 dereferenceable(96) %130, i32 noundef %133, i1 noundef zeroext true) [ "funclet"(token %125) ]
          to label %134 unwind label %179

134:                                              ; preds = %124
  catchret from %125 to label %148

135:                                              ; preds = %109
  %136 = icmp eq i32 %120, -1
  br i1 %136, label %140, label %137

137:                                              ; preds = %135
  %138 = add nsw i64 %110, -1
  %139 = icmp sgt i64 %110, 1
  br i1 %139, label %109, label %140

140:                                              ; preds = %84, %135, %137, %104
  %141 = phi i32 [ %106, %104 ], [ 4, %135 ], [ %106, %137 ], [ 4, %84 ]
  %142 = load ptr, ptr %0, align 8
  %143 = getelementptr inbounds i8, ptr %142, i64 4
  %144 = load i32, ptr %143, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, ptr %0, i64 %145
  %147 = getelementptr inbounds i8, ptr %146, i64 40
  store i64 0, ptr %147, align 8
  br label %148

148:                                              ; preds = %32, %51, %140, %134
  %149 = phi i32 [ %141, %140 ], [ %122, %134 ], [ 4, %51 ], [ 4, %32 ]
  %150 = load ptr, ptr %0, align 8
  %151 = getelementptr inbounds i8, ptr %150, i64 4
  %152 = load i32, ptr %151, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8, ptr %0, i64 %153
  %155 = getelementptr inbounds i8, ptr %154, i64 16
  %156 = load i32, ptr %155, align 8
  %157 = or i32 %156, %149
  invoke void @"?clear@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"(ptr noundef nonnull align 8 dereferenceable(96) %154, i32 noundef %157, i1 noundef zeroext false)
          to label %158 unwind label %179

158:                                              ; preds = %148
  %159 = tail call noundef i32 @"?uncaught_exceptions@std@@YAHXZ"() #15
  %160 = icmp eq i32 %159, 0
  %161 = load ptr, ptr %3, align 8
  br i1 %160, label %162, label %163

162:                                              ; preds = %158
  tail call void @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %161) #15
  br label %163

163:                                              ; preds = %162, %158
  %164 = load ptr, ptr %161, align 8
  %165 = getelementptr inbounds i8, ptr %164, i64 4
  %166 = load i32, ptr %165, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i8, ptr %161, i64 %167
  %169 = getelementptr inbounds i8, ptr %168, i64 72
  %170 = load ptr, ptr %169, align 8
  %171 = icmp eq ptr %170, null
  br i1 %171, label %178, label %172

172:                                              ; preds = %163
  %173 = load ptr, ptr %170, align 8
  %174 = getelementptr inbounds i8, ptr %173, i64 16
  %175 = load ptr, ptr %174, align 8
  invoke void %175(ptr noundef nonnull align 8 dereferenceable(104) %170)
          to label %178 unwind label %176

176:                                              ; preds = %172
  %177 = cleanuppad within none []
  call void @__std_terminate() #14 [ "funclet"(token %177) ]
  unreachable

178:                                              ; preds = %163, %172
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #15
  ret ptr %0

179:                                              ; preds = %148, %124, %121
  %180 = cleanuppad within none []
  call void @"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %3) #15 [ "funclet"(token %180) ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #15
  cleanupret from %180 unwind to caller
}

; Function Attrs: noreturn nounwind
declare dllimport void @terminate() local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @"?my_static_free@@YAXPEAX_K@Z"(ptr nocapture noundef readnone %0, i64 noundef %1) local_unnamed_addr #3 {
  ret void
}

; Function Attrs: mustprogress nounwind sspstrong uwtable
define dso_local void @"?set_nonblocking@@YAX_K@Z"(i64 noundef %0) local_unnamed_addr #4 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #15
  store i32 1, ptr %2, align 4
  %3 = call i32 @ioctlsocket(i64 noundef %0, i32 noundef -2147195266, ptr noundef nonnull %2) #15
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #15
  ret void
}

; Function Attrs: nounwind
declare dllimport i32 @ioctlsocket(i64 noundef, i32 noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: mustprogress sspstrong uwtable
define dso_local void @"?handle_client@@YA?AUTask@@_K@Z"(ptr dead_on_unwind nocapture writable writeonly sret(%struct.Task) align 8 %0, i64 noundef %1) local_unnamed_addr #0 personality ptr @__CxxFrameHandler3 {
  %3 = load i64, ptr @pool_offset, align 8
  %4 = add i64 %3, 1056
  %5 = icmp ugt i64 %4, 65536
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cerr@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0CC@CIJDCBME@?$FLCRITICAL?$FN?5Out?5of?5static?5memory?$CB@")
  tail call void @terminate() #14
  unreachable

8:                                                ; preds = %2
  %9 = getelementptr inbounds [65536 x i8], ptr @task_memory_pool, i64 0, i64 %3
  store i64 %4, ptr @pool_offset, align 8
  store ptr @"?handle_client@@YA?AUTask@@_K@Z.resume", ptr %9, align 8
  %10 = getelementptr inbounds i8, ptr %9, i64 8
  store ptr @"?handle_client@@YA?AUTask@@_K@Z.destroy", ptr %10, align 8
  %11 = getelementptr inbounds i8, ptr %9, i64 24
  store i64 %1, ptr %11, align 8
  store ptr %9, ptr %0, align 8, !alias.scope !18
  %12 = getelementptr inbounds i8, ptr %9, i64 17
  store i2 0, ptr %12, align 1
  ret void
}

declare dso_local i32 @__CxxFrameHandler3(...)

; Function Attrs: nounwind
declare dllimport i32 @recv(i64 noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare dllimport i32 @WSAGetLastError() local_unnamed_addr #5

; Function Attrs: nounwind
declare dllimport i32 @send(i64 noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare dllimport i32 @closesocket(i64 noundef) local_unnamed_addr #5

; Function Attrs: sspstrong uwtable
define internal void @"??__Factive_tasks@@YAXXZ"() #7 {
  %1 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 32), align 16
  %2 = icmp eq ptr %1, null
  br i1 %2, label %6, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds i8, ptr %1, i64 8
  %5 = load ptr, ptr %4, align 8
  tail call fastcc void %5(ptr nonnull %1) #15
  br label %6

6:                                                ; preds = %3, %0
  %7 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 24), align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %6
  %10 = getelementptr inbounds i8, ptr %7, i64 8
  %11 = load ptr, ptr %10, align 8
  tail call fastcc void %11(ptr nonnull %7) #15
  br label %12

12:                                               ; preds = %9, %6
  %13 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 16), align 16
  %14 = icmp eq ptr %13, null
  br i1 %14, label %18, label %15

15:                                               ; preds = %12
  %16 = getelementptr inbounds i8, ptr %13, i64 8
  %17 = load ptr, ptr %16, align 8
  tail call fastcc void %17(ptr nonnull %13) #15
  br label %18

18:                                               ; preds = %15, %12
  %19 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 8), align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %24, label %21

21:                                               ; preds = %18
  %22 = getelementptr inbounds i8, ptr %19, i64 8
  %23 = load ptr, ptr %22, align 8
  tail call fastcc void %23(ptr nonnull %19) #15
  br label %24

24:                                               ; preds = %21, %18
  %25 = load ptr, ptr @active_tasks, align 16
  %26 = icmp eq ptr %25, null
  br i1 %26, label %30, label %27

27:                                               ; preds = %24
  %28 = getelementptr inbounds i8, ptr %25, i64 8
  %29 = load ptr, ptr %28, align 8
  tail call fastcc void %29(ptr nonnull %25) #15
  br label %30

30:                                               ; preds = %24, %27
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local i32 @atexit(ptr) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse noreturn sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #9 personality ptr @__CxxFrameHandler3 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.WSAData, align 8
  %3 = alloca %struct.sockaddr_in, align 4
  call void @llvm.lifetime.start.p0(i64 408, ptr nonnull %2) #15
  %4 = call i32 @WSAStartup(i16 noundef 514, ptr noundef nonnull %2) #15
  %5 = call i64 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6) #15
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #15
  store i32 1, ptr %1, align 4
  %6 = call i32 @ioctlsocket(i64 noundef %5, i32 noundef -2147195266, ptr noundef nonnull %1) #15
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #15
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #15
  %7 = getelementptr inbounds i8, ptr %3, i64 8
  store i64 0, ptr %7, align 4
  store i16 2, ptr %3, align 4
  %8 = getelementptr inbounds i8, ptr %3, i64 4
  store i32 0, ptr %8, align 4
  %9 = call i16 @htons(i16 noundef 8080) #15
  %10 = getelementptr inbounds i8, ptr %3, i64 2
  store i16 %9, ptr %10, align 2
  %11 = call i32 @bind(i64 noundef %5, ptr noundef nonnull %3, i32 noundef 16) #15
  %12 = call i32 @listen(i64 noundef %5, i32 noundef 2147483647) #15
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0DC@EGHDJLEA@?9?9?9?5HTTP?5Server?5?$CIAsync?1Non?9Block@")
  br label %14

14:                                               ; preds = %117, %0
  %15 = call i64 @accept(i64 noundef %5, ptr noundef null, ptr noundef null) #15
  %16 = icmp eq i64 %15, -1
  br i1 %16, label %77, label %17

17:                                               ; preds = %14
  %18 = load ptr, ptr @active_tasks, align 16
  %19 = icmp eq ptr %18, null
  br i1 %19, label %23, label %20

20:                                               ; preds = %17
  %21 = load ptr, ptr %18, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %50

23:                                               ; preds = %17, %20, %50, %53, %56, %59, %62, %65, %68, %71
  %24 = phi i32 [ 0, %20 ], [ 0, %17 ], [ 1, %50 ], [ 1, %53 ], [ 2, %56 ], [ 2, %59 ], [ 3, %62 ], [ 3, %65 ], [ 4, %68 ], [ 4, %71 ]
  %25 = phi ptr [ @active_tasks, %20 ], [ @active_tasks, %17 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 8), %50 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 8), %53 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 16), %56 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 16), %59 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 24), %62 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 24), %65 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 32), %68 ], [ getelementptr inbounds (i8, ptr @active_tasks, i64 32), %71 ]
  %26 = load i64, ptr @pool_offset, align 8
  %27 = add i64 %26, 1056
  %28 = icmp ugt i64 %27, 65536
  br i1 %28, label %29, label %31

29:                                               ; preds = %23
  %30 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cerr@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0CC@CIJDCBME@?$FLCRITICAL?$FN?5Out?5of?5static?5memory?$CB@")
  call void @terminate() #14
  unreachable

31:                                               ; preds = %23
  %32 = getelementptr inbounds [65536 x i8], ptr @task_memory_pool, i64 0, i64 %26
  store i64 %27, ptr @pool_offset, align 8
  store ptr @"?handle_client@@YA?AUTask@@_K@Z.resume", ptr %32, align 8
  %33 = getelementptr inbounds i8, ptr %32, i64 8
  store ptr @"?handle_client@@YA?AUTask@@_K@Z.destroy", ptr %33, align 8
  %34 = getelementptr inbounds i8, ptr %32, i64 24
  store i64 %15, ptr %34, align 8
  %35 = getelementptr inbounds i8, ptr %32, i64 17
  store i2 0, ptr %35, align 1
  %36 = load ptr, ptr %25, align 8
  %37 = icmp eq ptr %36, null
  br i1 %37, label %41, label %38

38:                                               ; preds = %31
  %39 = getelementptr inbounds i8, ptr %36, i64 8
  %40 = load ptr, ptr %39, align 8
  call fastcc void %40(ptr nonnull %36) #15
  br label %41

41:                                               ; preds = %38, %31
  %42 = ptrtoint ptr %32 to i64
  store i64 %42, ptr %25, align 8
  %43 = load ptr, ptr %32, align 8
  %44 = icmp eq ptr %43, null
  br i1 %44, label %46, label %45

45:                                               ; preds = %41
  call fastcc void @"?handle_client@@YA?AUTask@@_K@Z.resume"(ptr nonnull %32)
  br label %46

46:                                               ; preds = %41, %45
  %47 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0CA@ICOMKMBL@?$FLSCHEDULER?$FN?5New?5client?5in?5slot?5?$AA@")
  %48 = call noundef nonnull align 8 dereferenceable(8) ptr @"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@H@Z"(ptr noundef nonnull align 8 dereferenceable(8) %47, i32 noundef %24)
  %49 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) %48, ptr noundef nonnull @"??_C@_01EEMJAFIK@?6?$AA@")
  br label %77

50:                                               ; preds = %20
  %51 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 8), align 8
  %52 = icmp eq ptr %51, null
  br i1 %52, label %23, label %53

53:                                               ; preds = %50
  %54 = load ptr, ptr %51, align 8
  %55 = icmp eq ptr %54, null
  br i1 %55, label %23, label %56

56:                                               ; preds = %53
  %57 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 16), align 16
  %58 = icmp eq ptr %57, null
  br i1 %58, label %23, label %59

59:                                               ; preds = %56
  %60 = load ptr, ptr %57, align 8
  %61 = icmp eq ptr %60, null
  br i1 %61, label %23, label %62

62:                                               ; preds = %59
  %63 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 24), align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %23, label %65

65:                                               ; preds = %62
  %66 = load ptr, ptr %63, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %23, label %68

68:                                               ; preds = %65
  %69 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 32), align 16
  %70 = icmp eq ptr %69, null
  br i1 %70, label %23, label %71

71:                                               ; preds = %68
  %72 = load ptr, ptr %69, align 8
  %73 = icmp eq ptr %72, null
  br i1 %73, label %23, label %74

74:                                               ; preds = %71
  %75 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0CP@BDLKAANJ@?$FLSCHEDULER?$FN?5Server?5full?0?5droppin@")
  %76 = call i32 @closesocket(i64 noundef %15) #15
  br label %77

77:                                               ; preds = %46, %74, %14
  %78 = load ptr, ptr @active_tasks, align 16
  %79 = icmp eq ptr %78, null
  br i1 %79, label %85, label %80

80:                                               ; preds = %77
  %81 = load ptr, ptr %78, align 8
  %82 = icmp eq ptr %81, null
  br i1 %82, label %85, label %83

83:                                               ; preds = %80
  %84 = load ptr, ptr %78, align 8
  call fastcc void %84(ptr nonnull %78)
  br label %85

85:                                               ; preds = %83, %77, %80
  %86 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 8), align 8
  %87 = icmp eq ptr %86, null
  br i1 %87, label %93, label %88

88:                                               ; preds = %85
  %89 = load ptr, ptr %86, align 8
  %90 = icmp eq ptr %89, null
  br i1 %90, label %93, label %91

91:                                               ; preds = %88
  %92 = load ptr, ptr %86, align 8
  call fastcc void %92(ptr nonnull %86)
  br label %93

93:                                               ; preds = %91, %88, %85
  %94 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 16), align 16
  %95 = icmp eq ptr %94, null
  br i1 %95, label %101, label %96

96:                                               ; preds = %93
  %97 = load ptr, ptr %94, align 8
  %98 = icmp eq ptr %97, null
  br i1 %98, label %101, label %99

99:                                               ; preds = %96
  %100 = load ptr, ptr %94, align 8
  call fastcc void %100(ptr nonnull %94)
  br label %101

101:                                              ; preds = %99, %96, %93
  %102 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 24), align 8
  %103 = icmp eq ptr %102, null
  br i1 %103, label %109, label %104

104:                                              ; preds = %101
  %105 = load ptr, ptr %102, align 8
  %106 = icmp eq ptr %105, null
  br i1 %106, label %109, label %107

107:                                              ; preds = %104
  %108 = load ptr, ptr %102, align 8
  call fastcc void %108(ptr nonnull %102)
  br label %109

109:                                              ; preds = %107, %104, %101
  %110 = load ptr, ptr getelementptr inbounds (i8, ptr @active_tasks, i64 32), align 16
  %111 = icmp eq ptr %110, null
  br i1 %111, label %117, label %112

112:                                              ; preds = %109
  %113 = load ptr, ptr %110, align 8
  %114 = icmp eq ptr %113, null
  br i1 %114, label %117, label %115

115:                                              ; preds = %112
  %116 = load ptr, ptr %110, align 8
  call fastcc void %116(ptr nonnull %110)
  br label %117

117:                                              ; preds = %115, %112, %109
  call void @Sleep(i32 noundef 10) #15
  br label %14, !llvm.loop !21
}

; Function Attrs: nounwind
declare dllimport i32 @WSAStartup(i16 noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare dllimport i64 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #10

; Function Attrs: nounwind
declare dllimport i16 @htons(i16 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare dllimport i32 @bind(i64 noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare dllimport i32 @listen(i64 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare dllimport i64 @accept(i64 noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

declare dllimport noundef nonnull align 8 dereferenceable(8) ptr @"??6?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV01@H@Z"(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #11

; Function Attrs: nounwind
declare dllimport void @Sleep(i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strstr(ptr noundef, ptr nocapture noundef) local_unnamed_addr #6

declare dllimport noundef i32 @"?sputc@?$basic_streambuf@DU?$char_traits@D@std@@@std@@QEAAHD@Z"(ptr noundef nonnull align 8 dereferenceable(104), i8 noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nounwind sspstrong uwtable
define linkonce_odr dso_local void @"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #4 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %2 = tail call noundef i32 @"?uncaught_exceptions@std@@YAHXZ"() #15
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = load ptr, ptr %0, align 8
  tail call void @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %5) #15
  br label %6

6:                                                ; preds = %4, %1
  %7 = load ptr, ptr %0, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds i8, ptr %8, i64 4
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, ptr %7, i64 %11
  %13 = getelementptr inbounds i8, ptr %12, i64 72
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %22, label %16

16:                                               ; preds = %6
  %17 = load ptr, ptr %14, align 8
  %18 = getelementptr inbounds i8, ptr %17, i64 16
  %19 = load ptr, ptr %18, align 8
  invoke void %19(ptr noundef nonnull align 8 dereferenceable(104) %14)
          to label %22 unwind label %20

20:                                               ; preds = %16
  %21 = cleanuppad within none []
  call void @__std_terminate() #14 [ "funclet"(token %21) ]
  unreachable

22:                                               ; preds = %6, %16
  ret void
}

; Function Attrs: nounwind
declare dllimport noundef zeroext i1 @"?good@ios_base@std@@QEBA_NXZ"(ptr noundef nonnull align 8 dereferenceable(72)) local_unnamed_addr #5

declare dllimport noundef nonnull align 8 dereferenceable(8) ptr @"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #11

; Function Attrs: mustprogress nounwind sspstrong uwtable
define linkonce_odr dso_local void @"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %2 = load ptr, ptr %0, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 4
  %5 = load i32, ptr %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8, ptr %2, i64 %6
  %8 = getelementptr inbounds i8, ptr %7, i64 72
  %9 = load ptr, ptr %8, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %15, label %11

11:                                               ; preds = %1
  %12 = load ptr, ptr %9, align 8
  %13 = getelementptr inbounds i8, ptr %12, i64 16
  %14 = load ptr, ptr %13, align 8
  invoke void %14(ptr noundef nonnull align 8 dereferenceable(104) %9)
          to label %15 unwind label %16

15:                                               ; preds = %11, %1
  ret void

16:                                               ; preds = %11
  %17 = cleanuppad within none []
  call void @__std_terminate() #14 [ "funclet"(token %17) ]
  unreachable
}

declare dso_local void @__std_terminate() local_unnamed_addr

declare dllimport void @"?clear@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"(ptr noundef nonnull align 8 dereferenceable(96), i32 noundef, i1 noundef zeroext) local_unnamed_addr #11

; Function Attrs: nounwind
declare dso_local noundef i32 @"?uncaught_exceptions@std@@YAHXZ"() local_unnamed_addr #5

; Function Attrs: nounwind
declare dllimport void @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #5

; Function Attrs: nofree nounwind sspstrong uwtable
define internal void @_GLOBAL__sub_I_CoroutineProject.cpp() #12 personality ptr @__CxxFrameHandler3 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(40) @active_tasks, i8 0, i64 40, i1 false)
  %1 = tail call i32 @atexit(ptr nonnull @"??__Factive_tasks@@YAXXZ") #15
  ret void
}

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare i32 @memcmp(ptr nocapture, ptr nocapture, i64) local_unnamed_addr #13

; Function Attrs: mustprogress sspstrong uwtable
define internal fastcc void @"?handle_client@@YA?AUTask@@_K@Z.resume"(ptr noundef nonnull align 16 dereferenceable(1056) %0) #0 personality ptr @__CxxFrameHandler3 {
  %2 = alloca i32, align 4
  %3 = getelementptr inbounds i8, ptr %0, i64 32
  %4 = getelementptr inbounds i8, ptr %0, i64 17
  %5 = load i2, ptr %4, align 1
  %6 = icmp eq i2 %5, 0
  br i1 %6, label %7, label %38

7:                                                ; preds = %1
  %8 = getelementptr inbounds i8, ptr %0, i64 24
  %9 = load i64, ptr %8, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #15
  store i32 1, ptr %2, align 4
  %10 = call i32 @ioctlsocket(i64 noundef %9, i32 noundef -2147195266, ptr noundef nonnull %2) #15
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #15
  br label %11

11:                                               ; preds = %7, %38
  %12 = phi i32 [ %40, %38 ], [ 0, %7 ]
  %13 = getelementptr inbounds i8, ptr %0, i64 20
  %14 = getelementptr inbounds i8, ptr %0, i64 24
  br label %15

15:                                               ; preds = %11, %24
  %16 = phi i32 [ %12, %11 ], [ %25, %24 ]
  %17 = zext nneg i32 %16 to i64
  %18 = sub i32 1023, %16
  %19 = getelementptr inbounds i8, ptr %3, i64 %17
  br label %20

20:                                               ; preds = %15, %33
  store i32 %16, ptr %13, align 4
  %21 = load i64, ptr %14, align 8
  %22 = call i32 @recv(i64 noundef %21, ptr noundef nonnull %19, i32 noundef %18, i32 noundef 0) #15
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %33

24:                                               ; preds = %20
  %25 = add nuw nsw i32 %22, %16
  %26 = zext nneg i32 %25 to i64
  %27 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 %26
  store i8 0, ptr %27, align 1
  %28 = call noundef ptr @strstr(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull dereferenceable(1) @"??_C@_04FMMHFHOO@?$AN?6?$AN?6?$AA@") #15
  %29 = icmp eq ptr %28, null
  br i1 %29, label %15, label %30, !llvm.loop !23

30:                                               ; preds = %24
  %31 = getelementptr inbounds i8, ptr %0, i64 24
  %32 = invoke noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0CB@PBFOGNMP@?$FLSERVER?$FN?5Full?5request?5received?4?6@")
          to label %43 unwind label %58

33:                                               ; preds = %20
  switch i32 %22, label %20 [
    i32 -1, label %34
    i32 0, label %41
  ], !llvm.loop !23

34:                                               ; preds = %33
  %35 = getelementptr inbounds i8, ptr %0, i64 24
  %36 = call i32 @WSAGetLastError() #15
  %37 = icmp eq i32 %36, 10035
  br i1 %37, label %62, label %43

38:                                               ; preds = %1
  %39 = getelementptr inbounds i8, ptr %0, i64 20
  %40 = load i32, ptr %39, align 4
  br label %11, !llvm.loop !23

41:                                               ; preds = %33
  %42 = getelementptr inbounds i8, ptr %0, i64 24
  br label %43

43:                                               ; preds = %41, %34, %30
  %44 = phi ptr [ %31, %30 ], [ %35, %34 ], [ %42, %41 ]
  %45 = phi i32 [ %25, %30 ], [ %16, %34 ], [ %16, %41 ]
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %47, label %53

47:                                               ; preds = %43
  %48 = call i32 @memcmp(ptr noundef nonnull dereferenceable(3) %3, ptr noundef nonnull dereferenceable(3) @"??_C@_03HAPOJHBM@GET?$AA@", i64 3)
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = load i64, ptr %44, align 8
  %52 = call i32 @send(i64 noundef %51, ptr noundef nonnull @"??_C@_0GC@OHIFMJHH@HTTP?11?40?5200?5OK?$AN?6Content?9Type?3?5t@", i32 noundef 97, i32 noundef 0) #15
  br label %53

53:                                               ; preds = %50, %47, %43
  %54 = load i64, ptr %44, align 8
  %55 = call i32 @closesocket(i64 noundef %54) #15
  %56 = invoke noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0BJ@FAGIGACG@?$FLSERVER?$FN?5Task?5finished?4?6?$AA@")
          to label %57 unwind label %58

57:                                               ; preds = %53
  store ptr null, ptr %0, align 16
  br label %62

58:                                               ; preds = %53, %30
  %59 = catchswitch within none [label %60] unwind label %64

60:                                               ; preds = %58
  %61 = catchpad within %59 [ptr null, i32 64, ptr null]
  call void @terminate() #14 [ "funclet"(token %61) ]
  unreachable

62:                                               ; preds = %34, %57
  %63 = phi i2 [ -2, %57 ], [ 1, %34 ]
  store i2 %63, ptr %4, align 1
  ret void

64:                                               ; preds = %58
  %65 = cleanuppad within none []
  store ptr null, ptr %0, align 16
  store i2 -2, ptr %4, align 1
  cleanupret from %65 unwind to caller
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define internal fastcc void @"?handle_client@@YA?AUTask@@_K@Z.destroy"(ptr nocapture nonnull readnone align 16 %0) #3 personality ptr @__CxxFrameHandler3 {
  ret void
}

attributes #0 = { mustprogress sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind }
attributes #9 = { mustprogress norecurse noreturn sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #11 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind willreturn memory(argmem: read) }
attributes #14 = { noreturn nounwind }
attributes #15 = { nounwind }

!llvm.linker.options = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !11, !12}
!llvm.module.flags = !{!13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !{!"/DEFAULTLIB:msvcrt.lib"}
!1 = !{!"/DEFAULTLIB:oldnames.lib"}
!2 = !{!"/FAILIFMISMATCH:\22_MSC_VER=1900\22"}
!3 = !{!"/FAILIFMISMATCH:\22_ITERATOR_DEBUG_LEVEL=0\22"}
!4 = !{!"/FAILIFMISMATCH:\22RuntimeLibrary=MD_DynamicRelease\22"}
!5 = !{!"/DEFAULTLIB:msvcprt.lib"}
!6 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!7 = !{!"/alternatename:_Avx2WmemEnabled=_Avx2WmemEnabledWeakValue"}
!8 = !{!"/FAILIFMISMATCH:\22annotate_string=0\22"}
!9 = !{!"/FAILIFMISMATCH:\22annotate_vector=0\22"}
!10 = !{!"/FAILIFMISMATCH:\22_COROUTINE_ABI=2\22"}
!11 = !{!"/DEFAULTLIB:uuid.lib"}
!12 = !{!"/DEFAULTLIB:Ws2_32.lib"}
!13 = !{i32 1, !"wchar_size", i32 2}
!14 = !{i32 8, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 2}
!16 = !{i32 1, !"MaxTLSAlign", i32 65536}
!17 = !{!"clang version 19.1.5"}
!18 = !{!19}
!19 = distinct !{!19, !20, !"?get_return_object@promise_type@Task@@QEAA?AU2@XZ: argument 0"}
!20 = distinct !{!20, !"?get_return_object@promise_type@Task@@QEAA?AU2@XZ"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
