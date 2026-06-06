import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/features/auth/presentation/pages/entrance_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/list_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/login_page.dart';
import 'package:majadigi/features/auth/presentation/pages/new_password_page.dart';
import 'package:majadigi/features/auth/presentation/pages/option_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/otp_password_page.dart';
import 'package:majadigi/features/auth/presentation/pages/register_page.dart';
import 'package:majadigi/features/auth/presentation/pages/registration_otp_page.dart';
import 'package:majadigi/features/auth/presentation/pages/reset_password_page.dart';
import 'package:majadigi/features/auth/presentation/pages/splash_page.dart';
import 'package:majadigi/features/auth/presentation/pages/ekonomi_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/kesehatan_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/pariwisata_layanan_page.dart';
import 'package:majadigi/features/auth/presentation/pages/sosial_layanan_page.dart';
import 'package:majadigi/features/home/presentation/pages/agenda/agenda_detail_page.dart';
import 'package:majadigi/features/home/presentation/pages/agenda/agenda_page.dart';
import 'package:majadigi/features/home/presentation/pages/aktivitas/aktivitas_page.dart';
import 'package:majadigi/features/home/presentation/pages/berita/berita_detail_page.dart';
import 'package:majadigi/features/home/presentation/pages/berita/berita_page.dart';
import 'package:majadigi/features/home/presentation/pages/home_page.dart';
import 'package:majadigi/features/home/presentation/pages/layanan/layanan_cepat_kesehatan.dart';
import 'package:majadigi/features/home/presentation/pages/layanan/layanan_cepat_page.dart';
import 'package:majadigi/features/home/presentation/pages/layanan/layanan_cepat_wisata.dart';
import 'package:majadigi/features/home/presentation/pages/notification_page.dart';
import 'package:majadigi/features/home/presentation/pages/profile/data_diri_page.dart';
import 'package:majadigi/features/home/presentation/pages/profile/ubah_data_page.dart';
import 'package:majadigi/features/home/presentation/pages/profile/ubah_kata_sandi_page.dart';
import 'package:majadigi/features/navigation/presentation/main_navigation_page.dart';
import 'package:majadigi/features/service/layanan_bapenda/bapenda_page.dart';
import 'package:majadigi/features/service/layanan_bapenda/detail_njkp_bapenda.dart';
import 'package:majadigi/features/service/layanan_bapenda/detail_pajak_pkb.dart';
import 'package:majadigi/features/service/layanan_bapenda/info_pajak_bapenda.dart';
import 'package:majadigi/features/service/layanan_bapenda/njkp_bapenda.dart';
import 'package:majadigi/features/service/layanan_dasa_husada/antrian_pasien.dart';
import 'package:majadigi/features/service/layanan_dasa_husada/dasa_husada_page.dart';
import 'package:majadigi/features/service/layanan_dasa_husada/jadwal_operasi.dart';
import 'package:majadigi/features/service/layanan_dasa_husada/ketersediaan_kamar.dart';
import 'package:majadigi/features/service/layanan_destinasi_wisata/destinasi_wisata_page.dart';
import 'package:majadigi/features/service/layanan_destinasi_wisata/detail_destinasi_wisata_page.dart' as detail_page; 
import 'package:majadigi/features/service/layanan_destinasi_wisata/list_destinasi_wisata.dart';
import 'package:majadigi/features/service/layanan_harga_bahan/detail_bahan_pokok.dart';
import 'package:majadigi/features/service/layanan_harga_bahan/harga_bahan_page.dart';
import 'package:majadigi/features/service/layanan_karsa_husada/karsa_husada_page.dart';
import 'package:majadigi/features/service/layanan_kliniik_hoaks/detail_laporan_hoaks.dart';
import 'package:majadigi/features/service/layanan_kliniik_hoaks/klinik_hoaks_page.dart';
import 'package:majadigi/features/service/layanan_kliniik_hoaks/lacak_laporan_hoaks.dart';
import 'package:majadigi/features/service/layanan_kliniik_hoaks/laporan_hoaks.dart';
import 'package:majadigi/features/service/layanan_kliniik_hoaks/laporan_hoaks_ticket.dart';
import 'package:majadigi/features/service/layanan_kliniik_hoaks/list_laporan_hoaks.dart';
import 'package:majadigi/features/service/layanan_nomor_darurat/nomor_darurat_page.dart';
import 'package:majadigi/features/service/layanan_skrining_etibi/detail_hasil_skrining.dart';
import 'package:majadigi/features/service/layanan_skrining_etibi/faskes_choice.dart';
import 'package:majadigi/features/service/layanan_skrining_etibi/faskes_etibi_page.dart';
// import 'package:majadigi/features/service/layanan_skrining_etibi/faskes_etibi.dart';
import 'package:majadigi/features/service/layanan_skrining_etibi/form_skrining_etibi.dart';
import 'package:majadigi/features/service/layanan_skrining_etibi/hasil_skrining.dart';
import 'package:majadigi/features/service/layanan_skrining_etibi/riwayat_skrining.dart';
import 'package:majadigi/features/service/layanan_skrining_etibi/skrining_etibi.dart';
import 'package:majadigi/features/service/layanan_transjatim/detail_rute_transjatim.dart';
import 'package:majadigi/features/service/layanan_transjatim/transjatim_page.dart';
import 'package:majadigi/features/service/list_layanan/all_layanan_page.dart';

import '../../features/auth/presentation/pages/entrance_page.dart';
import '../../features/service/layanan_islamic_center/islamic_center_page.dart';
import '../../features/service/layanan_islamic_center/aula_islamic_center.dart';
import '../../features/service/layanan_islamic_center/detail_islamic_center.dart';
import '../../features/service/layanan_islamic_center/pesanan_islamic_center.dart';
import '../../features/service/layanan_islamic_center/pembayaran_islamic_center.dart';
import '../../features/service/layanan_islamic_center/islamic_center_finish.dart';
import '../../features/service/layanan_transjatim/rute_transjatim.dart';
import '../../features/service/layanan_transjatim/tiket_transjatim.dart';
import 'package:majadigi/features/bapenda/domain/entities/info_pajak_entity.dart';
import 'package:majadigi/features/bapenda/domain/entities/njkb_entity.dart';

class Routes {
  Routes._();

  static const mainNavigation = '/main_navigation';

  static const splash = '/';
  static const entrance = '/entrance';
  static const login = '/login';
  static const register = '/register';
  static const registerOtp = '/register_otp';

  static const home = '/home';
  static const notification = '/notification';

  static const berita = '/berita_page';
  static const beritaDetail = '/berita_detail_page';

  static const agenda = '/agenda_page';
  static const agendaDetail = '/agenda_detail_page';

  static const layananCepat = '/layanan_cepat_page';
  static const layananCepatKesehatan = '/layanan_cepat_kesehatan_page';
  static const layananCepatWisata = '/layanan_cepat_wisata_page';

  static const entranceLayanan = '/entrance_layanan';
  static const optionLayanan = '/option_layanan';
  static const ekonomiLayanan = '/ekonomi_layanan';
  static const pariwisataLayanan = '/pariwisata';
  static const sosialLayanan = '/sosial_layanan';
  static const kesehatanLayanan = '/kesehatan_layanan';
  static const listLayanan = '/list_layanan';
  static const resetPassword = '/reset_password';
  static const newPassword = '/new_password';
  static const otpPassword = '/otp_password';

  static const allLayanan = '/all_layanan';
  static const aktivitas = '/aktivias';

  static const layananDestinasiWisata = '/layanan_destinasi_wisata';
  static const detailLayananDestinasiWisata = '/detail_layanan_destinasi_wisata';
  static const listLayananDestinasiWisata = '/list_layanan_destinasi_wisata';

  static const layananTransjatim = '/layanan_transjatim';
  static const tiketTransjatim = '/tiket_transjatim';
  static const ruteTransjatim = '/rute_transjatim';
  static const detailRuteTransjatim = '/detail_rute_transjatim';

  static const layananDasaHusada = '/layanan_dasa_husada';
  static const kamarDasaHusada = '/kamar_dasa_husada';
  static const operasiDasaHusada = '/operasi_dasa_husada';
  static const antrianDasaHusada = '/antrian_dasa_husada';

  static const layananKarsaHusada = '/layanan_karsa_husada';

  static const layananKlinikHoaks = '/layanan_klinik_hoaks';

  static const layananIslamicCenter = '/layanan_islamic_center';
  static const detailLayananIslamicCenter = '/detail_layanan_islamic_center';
  static const detailIslamicCenter = '/detail_islamic_center';
  static const pesananIslamicCenter = '/pesanan_islamic_center';
  static const pembayaranIslamicCenter = '/pembayaran_islamic_center';
  static const islamicCenterFinish = '/islamic_center_finish';

  static const layananEtibi = '/layanan_etibi';
  static const formEtibi = '/form_etibi';
  static const hasilSkriningEtibi = '/hasil_skrining_etibi';
  static const riwayatEtibi = '/riwayat_etibi';
  static const detailSkriningEtibi = '/detail_skrining_etibi';
  static const faskesEtibi = '/faskes_etibi';
  static const faskesChoiceEtibi = '/faskes_choice_etibi';

  static const klinikHoaks = '/klinik_hoaks';
  static const laporanHoaks = '/laporan_hoaks';
  static const laporanHoaksTicket = '/laporan_hoaks_ticket';
  static const laporanHoaksLacak = '/laporan_hoaks_lacak';
  static const listLaporanHoaks = '/list_laporan_hoaks';
  static const detailLaporanHoaks = '/detail_laporan_hoaks';

  static const layananBapenda = '/layanan_bapenda';
  static const pajakBapenda = '/pajak_bapenda';
  static const njkpBapenda = '/njkp_bapenda';
  static const detailNjkpBapenda = '/detail_njkp_bapenda';
  static const detailPajakBapenda = '/detail_pajak_bapenda';

  static const layananNomorDarurat = '/nomor_darurat_page';

  static const layananHargaBahanPokok = '/bahan_pokok_page';
  static const detailHargaBahanPokok = '/detail_bahan_pokok_page';

  // Profile Routes
  static const dataDiri = '/data_diri';
  static const ubahNamaLengkap = '/ubah_nama_lengkap';
  static const ubahEmail = '/ubah_email';
  static const ubahNik = '/ubah_nik';
  static const ubahAlamat = '/ubah_alamat';
  static const ubahNoHp = '/ubah_no_hp';
  static const ubahKataSandi = '/ubah_kata_sandi';
}

final appRouter = GoRouter(
  initialLocation: Routes.mainNavigation ,
  routes: [
    GoRoute(
      path: Routes.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: Routes.mainNavigation,
      name: 'main navigation',
      builder: (context, state) {

        final index = int.tryParse(
          state.uri.queryParameters['index'] ?? '0',
        ) ?? 0;

        return MainNavigationPage(
          currentIndex: index,
        );
      },
    ),

    GoRoute(
      path: Routes.entrance,
      name: 'entrance',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: EntrancePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const EntrancePage(),
    ),
    GoRoute(
      path: Routes.login,
      name: 'login',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.register,
      name: 'register',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: RegisterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const RegisterPage(),
    ),

    GoRoute(
      path: Routes.registerOtp,
      name: 'register otp',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: RegistrationOtpPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const RegistrationOtpPage(),
    ),

    GoRoute(
      path: Routes.entranceLayanan,
      name: 'entrance layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: EntranceLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const EntranceLayananPage(),
    ),
    GoRoute(
      path: Routes.optionLayanan,
      name: 'option layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: OptionLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const OptionLayananPage(),
    ),
    GoRoute(
      path: Routes.ekonomiLayanan,
      name: 'ekonomi layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: EkonomiLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const EkonomiLayananPage(),
    ),
    GoRoute(
      path: Routes.kesehatanLayanan,
      name: 'kesehatan layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: KesehatanLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const KesehatanLayananPage(),
    ),
    GoRoute(
      path: Routes.pariwisataLayanan,
      name: 'pariwisata layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: PariwisataLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const PariwisataLayananPage(),
    ),
    GoRoute(
      path: Routes.sosialLayanan,
      name: 'sosial layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SosialLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const SosialLayananPage(),
    ),
    GoRoute(
      path: Routes.listLayanan,
      name: 'list layanan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: ListLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const ListLayananPage(),
    ),
    GoRoute(
      path: Routes.resetPassword,
      name: 'reset password',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: ResetPasswordPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const ResetPasswordPage(),
    ),
    GoRoute(
      path: Routes.newPassword,
      name: 'new password',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: NewPasswordPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const NewPasswordPage(),
    ),
    GoRoute(
      path: Routes.otpPassword,
      name: 'otp password',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: OtpPasswordPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const OtpPasswordPage(),
    ),
    GoRoute(
      path: Routes.home,
      name: 'home',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: Routes.notification,
      name: 'notifikasi',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: NotificationPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const NotificationPage(),
    ),

    GoRoute(
      path: Routes.berita,
      name: 'berita',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BeritaPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const BeritaPage(),
    ),

    GoRoute(
      path: Routes.beritaDetail,
      name: 'berita detail',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BeritaPageDetail(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const BeritaPageDetail(),
    ),

    GoRoute(
      path: Routes.agenda,
      name: 'agenda',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: AgendaPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const AgendaPage(),
    ),

    GoRoute(
      path: Routes.agendaDetail,
      name: 'agenda detail',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: AgendaDetailPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const AgendaDetailPage(),
    ),

    GoRoute(
      path: Routes.layananCepat,
      name: 'layanan cepat',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LayananCepatPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LayananCepatPage(),
    ),

    GoRoute(
      path: Routes.layananCepatWisata,
      name: 'layanan cepat wisata',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LayananCepatWisataPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LayananCepatWisataPage(),
    ),

    GoRoute(
      path: Routes.layananCepatKesehatan,
      name: 'layanan cepat kesehatan',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LayananCepatKesehatanPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LayananCepatKesehatanPage(),
    ),

    GoRoute(
      path: Routes.layananDestinasiWisata,
      name: 'destinasi wisata',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          // Pastikan DestinasiWisataPage ini dikenali dari import di atas
          child: const DestinasiWisataPage(), 
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),

    GoRoute(
      path: Routes.detailLayananDestinasiWisata,
      name: 'detail destinasi wisata',
      pageBuilder: (context, state) {
        final id = state.extra as int;
        return CustomTransitionPage(
          key: state.pageKey,
          // Gunakan prefix 'detail_page' yang kita buat tadi
          child: detail_page.DetailDestinasiWisataPage(destinasiId: id), 
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),

    GoRoute(
      path: Routes.listLayananDestinasiWisata,
      name: 'list destinasi wisata',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: ListDestinasiWisataPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const ListDestinasiWisataPage(),
    ),


    GoRoute(
      path: Routes.layananTransjatim,
      name: 'transjatim',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: TransjatimPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const TransjatimPage(),
    ),

    GoRoute(
      path: Routes.tiketTransjatim,
      name: 'tiket transjatim',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: TiketTransjatimPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const TiketTransjatimPage(),
    ),

    GoRoute(
      path: Routes.ruteTransjatim,
      name: 'rute transjatim',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: RuteTransjatimPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const RuteTransjatimPage(),
    ),

    GoRoute(
      path: Routes.detailRuteTransjatim,
      name: 'detail rute',
      pageBuilder: (context, state) {
        final id = state.extra as int; // Tangkap pelemparan parameter ID
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailRoutePage(routeId: id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),

    GoRoute(
      path: Routes.layananKarsaHusada,
      name: 'karsa husada',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: KarsaHusadaPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const KarsaHusadaPage(),
    ),

    GoRoute(
      path: Routes.layananDasaHusada,
      name: 'dasa husada',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: DasaHusadaPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const DasaHusadaPage(),
    ),

    GoRoute(
      path: Routes.kamarDasaHusada,
      name: 'kamar dasa husada',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: KetersediaanKamarPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const KetersediaanKamarPage(),
    ),

    GoRoute(
      path: Routes.operasiDasaHusada,
      name: 'operasi dasa husada',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: JadwalOperasiPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const JadwalOperasiPage(),
    ),

    GoRoute(
      path: Routes.antrianDasaHusada,
      name: 'antrian dasa husada',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: AntrianPasienPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const AntrianPasienPage(),
    ),

    GoRoute(
      path: Routes.layananEtibi,
      name: 'etibi',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SkriningEtibiPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const SkriningEtibiPage(),
    ),

    GoRoute(
      path: Routes.formEtibi,
      name: 'form etibi',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: FormSkriningEtibi(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const FormSkriningEtibi(),
    ),

    GoRoute(
      path: Routes.hasilSkriningEtibi,
      name: 'hasil skrining etibi',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: HasilSkriningEtibi(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const HasilSkriningEtibi(),
    ),

    GoRoute(
      path: Routes.riwayatEtibi,
      name: 'riwayat skrining etibi',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: RiwayatSkrining(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const RiwayatSkrining(),
    ),

    GoRoute(
      path: Routes.detailSkriningEtibi,
      name: 'detail skrining etibi',
      pageBuilder: (context, state) {
        // 1. Tangkap ID yang dilempar dari halaman riwayat
        final id = state.extra as int; 

        return CustomTransitionPage(
          key: state.pageKey,
          // 2. Masukkan ID-nya ke parameter questionnaireId
          child: DetailHasilSkrining(questionnaireId: id), 
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      // 3. Jika kamu memakai property builder juga, pastikan menangkap ID-nya:
      // builder: (context, state) => DetailHasilSkrining(questionnaireId: state.extra as int),
    ),
    GoRoute(
      path: Routes.faskesEtibi,
      name: 'faskes etibi',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: FaskesEtibiPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const FaskesEtibiPage(),
    ),

    GoRoute(
      path: Routes.faskesChoiceEtibi,
      name: 'faskes choice etibi',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: FaskesChoicePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const FaskesChoicePage(),
    ),

    GoRoute(
      path: Routes.layananIslamicCenter,
      name: 'islamic center',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: IslamicCenterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const IslamicCenterPage(),
    ),

    GoRoute(
      path: Routes.detailLayananIslamicCenter,
      name: 'detail islamic center',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: AulaIslamicCenter(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const AulaIslamicCenter(),
    ),

    GoRoute(
      path: Routes.detailIslamicCenter,
      name: 'detail aula',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailIslamicCenter(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const DetailIslamicCenter(),
    ),

    GoRoute(
      path: Routes.pesananIslamicCenter,
      name: 'pesanan islamic center',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: PesananIslamicCenter(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const PesananIslamicCenter(),
    ),

    GoRoute(
      path: Routes.pembayaranIslamicCenter,
      name: 'pembayaran islamic center',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: PembayaranIslamicCenter(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const PembayaranIslamicCenter(),
    ),

    GoRoute(
      path: Routes.islamicCenterFinish,
      name: 'islamic center finish',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: IslamicCenterFinish(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const IslamicCenterFinish(),
    ),

    GoRoute(
      path: Routes.layananKlinikHoaks,
      name: 'klinik hoaks',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: KlinikHoaksPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const KlinikHoaksPage(),
    ),

    GoRoute(
      path: Routes.laporanHoaks,
      name: 'laporan hoaks',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LaporanHoaks(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LaporanHoaks(),
    ),
    GoRoute(
      path: Routes.laporanHoaksTicket,
      name: 'laporan hoaks ticket',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LaporanHoaksTicket(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LaporanHoaksTicket(),
    ),

    GoRoute(
      path: Routes.laporanHoaksLacak,
      name: 'laporan hoaks lacak',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LaporanHoaksLacak(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const LaporanHoaksLacak(),
    ),

    GoRoute(
      path: Routes.listLaporanHoaks,
      name: 'list laporan hoaks ',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: ListLaporanHoaks(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const ListLaporanHoaks(),
    ),

    GoRoute(
      path: Routes.detailLaporanHoaks,
      name: 'detail laporan hoaks ',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailLaporanHoaks(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const DetailLaporanHoaks(),
    ),

    GoRoute(
      path: Routes.layananBapenda,
      name: 'bapenda',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BapendaPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const BapendaPage(),
    ),

    GoRoute(
      path: Routes.pajakBapenda,
      name: 'pajak bapenda',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: InfoPajakBapenda(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const InfoPajakBapenda(),
    ),

    GoRoute(
      path: Routes.njkpBapenda,
      name: 'njkp bapenda',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: NjkpBapenda(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const NjkpBapenda(),
    ),

      GoRoute(
        path: Routes.detailNjkpBapenda,
        name: 'detail njkp bapenda',
        pageBuilder: (context, state) {
          final dataNjkb = state.extra as NjkbResultEntity;

          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailNjkpBapenda(data: dataNjkb),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
       },
    ),

      GoRoute(
        path: Routes.detailPajakBapenda,
        name: 'detail pajak bapenda',
        pageBuilder: (context, state) {
          final dataPajak = state.extra as InfoPajakEntity;

          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailPajakBapenda(data: dataPajak), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
    ),

    GoRoute(
      path: Routes.layananNomorDarurat,
      name: 'layanan nomor darurat',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: NomorDaruratPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const NomorDaruratPage(),
    ),

    GoRoute(
      path: Routes.layananHargaBahanPokok,
      name: 'layanan bahan pokok',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: HargaBahanPokokPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const HargaBahanPokokPage(),
    ),

    GoRoute(
      path: Routes.detailHargaBahanPokok,
      name: 'detail harga bahan pokok',
      pageBuilder: (context, state) {
      
        final commodityId = state.extra as int? ?? 1; // Default ke 1 jika null

        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailBahanPokokPage(commodityId: commodityId), // Kirim ID ke halaman Detail
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),

    GoRoute(
      path: Routes.allLayanan,
      name: 'all',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: AllLayananPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const AllLayananPage(),
    ),

    GoRoute(
      path: Routes.aktivitas,
      name: 'aktivitas',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: ActivityPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (context, state) => const ActivityPage(),
    ),

    // Profile Routes
    // GoRoute(
    //   path: Routes.dataDiri,
    //   name: 'data diri',
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: DataDiriPage(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   builder: (context, state) => const DataDiriPage(),
    // ),
    //
    // GoRoute(
    //   path: Routes.ubahNamaLengkap,
    //   name: 'ubah nama lengkap',
    //   pageBuilder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: UbahDataPage(
    //         fieldType: 'nama_lengkap',
    //         initialValue: initialValue,
    //       ),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   builder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return UbahDataPage(
    //       fieldType: 'nama_lengkap',
    //       initialValue: initialValue,
    //     );
    //   },
    // ),
    //
    // GoRoute(
    //   path: Routes.ubahEmail,
    //   name: 'ubah email',
    //   pageBuilder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: UbahDataPage(
    //         fieldType: 'email',
    //         initialValue: initialValue,
    //       ),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   builder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return UbahDataPage(
    //       fieldType: 'email',
    //       initialValue: initialValue,
    //     );
    //   },
    // ),
    //
    // GoRoute(
    //   path: Routes.ubahNik,
    //   name: 'ubah nik',
    //   pageBuilder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: UbahDataPage(
    //         fieldType: 'nik',
    //         initialValue: initialValue,
    //       ),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   builder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return UbahDataPage(
    //       fieldType: 'nik',
    //       initialValue: initialValue,
    //     );
    //   },
    // ),
    //
    // GoRoute(
    //   path: Routes.ubahAlamat,
    //   name: 'ubah alamat',
    //   pageBuilder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: UbahDataPage(
    //         fieldType: 'alamat',
    //         initialValue: initialValue,
    //       ),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   builder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return UbahDataPage(
    //       fieldType: 'alamat',
    //       initialValue: initialValue,
    //     );
    //   },
    // ),
    //
    // GoRoute(
    //   path: Routes.ubahNoHp,
    //   name: 'ubah no hp',
    //   pageBuilder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: UbahDataPage(
    //         fieldType: 'no_hp',
    //         initialValue: initialValue,
    //       ),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   builder: (context, state) {
    //     final initialValue = state.extra as String? ?? '';
    //     return UbahDataPage(
    //       fieldType: 'no_hp',
    //       initialValue: initialValue,
    //     );
    //   },
    // ),
    //
    // GoRoute(
    //   path: Routes.ubahKataSandi,
    //   name: 'ubah kata sandi',
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: UbahKataSandiPage(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   builder: (context, state) => const UbahKataSandiPage(),
    // ),
  ]
);
