import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/quote_provider.dart';
import '../../utils/widgets/public_quote_item.dart';
import '../../utils/widgets/user_quote_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _loaded = false;

  bool _addQuote = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);


    // 👇 Tab change hone pe state update karo
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        setState(() {
          _addQuote = true;
        });
      } else {
        setState(() {
          _addQuote = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      final quoteProvider = Provider.of<QuoteProvider>(context, listen: false);
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      quoteProvider.loadUserQuotes(authProvider.user!.uid!);
      quoteProvider.loadPublicQuotes();

      Future.microtask(() {
        quoteProvider.loadUserQuotes(authProvider.user!.uid!);
        quoteProvider.loadPublicQuotes();
      });
      _loaded = true;
    }
  }



  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Public Quotes"),
            Tab(text: "My Quotes"),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
            },
          ),
        ],
      ),
      floatingActionButton: _addQuote
          ? FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-quote');
        },
        child: Icon(Icons.add),
      ) : null,
      body: TabBarView(
        controller: _tabController,
        children: [
          // --- Public Quotes ---
          _buildQuoteList(quoteProvider.publicQuotes, quoteProvider, false),

          // --- My Quotes ---
          _buildQuoteList(quoteProvider.userQuotes, quoteProvider, true),
        ],
      ),
    );
  }

  Widget _buildQuoteList(List quotes, QuoteProvider provider, bool isUserList) {
    /*if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }*/


    if (quotes.isEmpty) {
      return Center(child: Text(isUserList ? 'No quotes found.' : 'No public quotes found.'));
    }

    return ListView.builder(
      padding: EdgeInsets.only(bottom: 100),
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        print('Quote $quote');
        return isUserList
            ? UserQuoteItem(quote: quote, provider: provider)
            : PublicQuoteItem(quote: quote, provider: provider);
      },
    );
  }
}